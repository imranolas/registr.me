class Organisation < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :address3, :town, :postcode
  has_many :teachers
  has_many :users, through: :teachers
  has_many :klasses
  has_many :students
  has_many :lessons, through: :klasses
  has_many :registrations, through: :lessons
end
