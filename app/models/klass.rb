class Klass < ActiveRecord::Base
  attr_accessible :attendance, :name, :teacher_id, :lessons_attributes, :students_attributes
  belongs_to :teacher
  has_many :lessons
  has_many :klasses_students
  has_many :students, through: :klasses_students
  has_many :registrations, through: :lessons

  validates :name, presence: true
  validates :attendance, presence: true

  accepts_nested_attributes_for :lessons
  accepts_nested_attributes_for :students

  def overall_attendance
    if registrations.any?
      "#{(registrations.completed_lessons.where(attended: true).count / registrations.completed_lessons.count.to_f * 100).round}%"
    else
      "No data yet"
    end
  end

  def lessons_hash_for_charts
    hsh = { 
      labels: [],
      datasets: [
        {
          fillColor: "rgba(151,187,205,0.5)",
          strokeColor: "rgba(151,187,205,1)",
          pointColor: "rgba(151,187,205,1)",
          pointStrokeColor: "#fff",
          data: []
        }]
      }
    lessons.includes(:registrations).each do |l|
      hsh[:labels] << l.date_time.to_datetime.strftime('%d %b %Y')
      hsh[:datasets][0][:data] << l.registrations.where(attended: true).count
    end
    hsh
  end
end
