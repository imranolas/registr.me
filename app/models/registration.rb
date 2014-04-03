class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson
  attr_accessible :attended, :student_id, :lesson_id, :late, :absence_approved, :klass_id

  scope :completed_lessons, joins(:lesson).merge(Lesson.past)
  scope :by_student, ->(student) { where(registrations: {student_id: student.id}) }
  scope :attended, -> { where(attended: true) }
  scope :absent, -> { where(attended: false) }
  scope :late, -> { where(attended: true, late: true) }
  scope :ontime, -> { where(attended: true, late: false)}
  scope :approved_absence, -> { where(attended: false, absence_approved: true) }
  scope :unapproved_absence, -> { where(attended: false, absence_approved: false) }

  validates :student_id, uniqueness: { scope: :lesson_id }
  validates :klass_id, presence: true

  before_validation :set_klass_id

  def set_klass_id
    self.klass_id ||= lesson.klass_id
  end

end
