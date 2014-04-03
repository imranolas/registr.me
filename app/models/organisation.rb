class Organisation < ActiveRecord::Base
  attr_accessible :name
  has_many :teachers
  has_many :klasses
  has_many :students
end
