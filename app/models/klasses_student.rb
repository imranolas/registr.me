class KlassesStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :klass
  # attr_accessible :title, :body
end
