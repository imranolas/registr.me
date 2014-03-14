class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :klass
  attr_accessible :date_time, :room, :teacher_id

  validates :date_time, presence: true
  
end
