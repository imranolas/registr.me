class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :klass
  has_many :students, through: :klass
  has_many :registrations
  has_many :registered_students, through: :registrations, class_name: 'Student', foreign_key: :student_id
  attr_accessible :date_time, :room, :teacher_id, :klass_id

  validates :date_time, presence: true
  
end
