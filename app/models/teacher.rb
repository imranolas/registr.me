class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  attr_accessible :name, :user_id

  validates :user_id, presence: true

  def self.collection_for_select
    self.all.map { |t| ["#{self.user.email}", t.id]}
  end
end
