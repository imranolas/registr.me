class Student < ActiveRecord::Base
  attr_accessible :active, :name, :klass_ids
  has_many :klasses_students
  has_many :klasses, through: :klasses_students
  has_many :lessons, through: :klasses

  validates :name, presence: true
end
