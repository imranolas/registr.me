class Teacher < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id

  validates :user_id, presence: true
end
