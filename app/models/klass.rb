class Klass < ActiveRecord::Base
  attr_accessible :attendance, :name, :teacher_id
  belongs_to :teacher
  has_many :lessons
  has_many :klasses_students
  has_many :students, through: :klasses_students

  validates :name, presence: true
  validates :attendance, presence: true
end
