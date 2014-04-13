class Klass < ActiveRecord::Base
  attr_accessible :attendance, :name, :teacher_id, :lessons_attributes, :students_attributes
  belongs_to :teacher
  has_many :lessons, dependent: :destroy 
  has_many :klasses_students, dependent: :destroy
  has_many :students, through: :klasses_students
  has_many :registrations, through: :lessons, dependent: :destroy
  belongs_to :organisation

  validates :name, presence: true
  validates :attendance, presence: true

  before_validation :set_attendance

  accepts_nested_attributes_for :lessons
  accepts_nested_attributes_for :students

  def set_attendance
    attendance ||= 75
  end

  def overall_attendance
    if registrations.any?
      attended_students = registrations.completed_lessons.where(attended: true).count
      all_students = registrations.completed_lessons.count
      percentage = (attended_students / all_students.to_f * 100).round
      "#{attended_students}/#{all_students} (#{percentage}%)"
    else
      "No data yet"
    end
  end

  def student_attendance(student)
    if registrations.where(student_id: student.id).any?
      attended = registrations.completed_lessons.attended.by_student(student).count
      total = registrations.completed_lessons.by_student(student).count
      percentage = (attended / total.to_f * 100).round
    else
      0
    end
  end

  def attendance_for(student)
    if registrations.where(student_id: student.id).any?
      attended = registrations.completed_lessons.attended.by_student(student).count
      total = registrations.completed_lessons.by_student(student).count
      percentage = (attended / total.to_f * 100).round
      "#{attended}/#{total} (#{percentage}%)"
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
          data: [],
          title: 'Attended'
        },
        {
          fillColor: "rgba(145, 176, 123, 0.3)",
          strokeColor: "rgba(145, 176, 123, 1)",
          pointColor: "rgba(145, 176, 123, 1)",
          pointStrokeColor: "#fff",
          data: [],
          title: 'Late'
        }]
      }
    lessons.past.includes(:registrations).each do |l|
      hsh[:labels] << l.date_time.to_datetime.strftime('%d %b %Y')
      hsh[:datasets][0][:data] << l.registrations.where(attended: true).count
      hsh[:datasets][1][:data] << l.registrations.where(late: true).count
    end
    hsh
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      klass = find_by_id(row["id"]) || new
      klass.attributes = row.to_hash.slice(*accessible_attributes)
      klass.save!
    end
  end
end
