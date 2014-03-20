class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson
  attr_accessible :attended, :student_id, :lesson_id

  scope :completed_lessons, joins(:lesson).merge(Lesson.past)

  validates :student_id, uniqueness: { scope: :lesson_id }
end
