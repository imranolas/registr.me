class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :klass
  has_many :students, through: :klass
  has_many :registrations, dependent: :destroy
  has_many :registered_students, through: :registrations, class_name: 'Student', foreign_key: :student_id
  attr_accessible :date_time, :room, :teacher_id, :klass_id, :date, :time
  attr_accessor :date, :time

  validates :date_time, presence: true

  before_validation :set_date_time
  after_save :create_registrations

  default_scope { order(:date_time) }
  
  scope :upcoming, -> { where('lessons.date_time > ?', DateTime.now ).order('date_time DESC') }
  scope :past, -> { where('lessons.date_time < ?', DateTime.now ).order('date_time ASC') }

  def attendance
    if registrations.any?
      "#{(registrations.where(attended: true).count / registrations.count.to_f * 100).round}%"
    else
      "No data yet"
    end
  end

  def date_to_s
    date_time.to_date.strftime('%d-%m-%Y')
  end

  def date_us
    date_time.to_datetime.strftime("%d/%m/%Y")
  end

  def time_to_s
    date_time.to_datetime.strftime('%H:%M')
  end

  def set_teacher
    self.teacher ||= klass.teacher
  end


  def set_date_time
    if date && time
      self.date_time = "#{self.date} #{self.time}".to_datetime
    end
  end

  def create_registrations
    students.each do |student|
      Registration.create(student_id: student.id, lesson_id: self.id )
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      lesson = find_by_id(row["id"]) || new
      lesson.attributes = row.to_hash.slice(*accessible_attributes)
      lesson.klass = Klass.find_or_create_by_name(row["class_name"]) if row["class_name"]
      lesson.save!
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |lesson|
        csv << lesson.attributes.values_at(*column_names)
      end
    end
  end
end
