class Klass < ActiveRecord::Base
  attr_accessible :attendance, :name, :teacher_id, :lessons_attributes, :students_attributes
  belongs_to :teacher
  has_many :lessons
  has_many :klasses_students
  has_many :students, through: :klasses_students

  validates :name, presence: true
  validates :attendance, presence: true

  accepts_nested_attributes_for :lessons
  accepts_nested_attributes_for :students
end
