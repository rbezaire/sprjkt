class Space < ActiveRecord::Base
  belongs_to :user
  has_many :layers
  serialize :clickX
  serialize :clickY
  serialize :clickDrag
  
end
