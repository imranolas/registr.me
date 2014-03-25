class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson
  attr_accessible :attended, :student_id, :lesson_id, :late, :absence_approved

  scope :completed_lessons, joins(:lesson).merge(Lesson.past)
  scope :by_student, ->(student) { where(registrations: {student_id: student.id}) }
  scope :attended, -> { where(attended: true) }
  scope :absent, -> { where(attended: false) }
  scope :late, -> { where(attended: true, late: true) }
  scope :ontime, -> { where(attended: true, late: false)}
  scope :approved_absence, -> { where(attended: false, absence_approved: true) }
  scope :unapproved_absence, -> { where(attended: false, absence_approved: false) }

  validates :student_id, uniqueness: { scope: :lesson_id }

  # before_update :set_attendance

  def set_attendance
    if attended
      self.absence_approved = false
    else
      self.late = false
    end
  end

end
