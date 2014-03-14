class Student < ActiveRecord::Base
  attr_accessible :active, :name
  has_many :klasses_students
  has_many :klasses, through: :klasses_students

  validates :name, presence: true
end
