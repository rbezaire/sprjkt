class Layer < ActiveRecord::Base
	belongs_to :space
	belongs_to :user
	serialize :aryx
	serialize :aryy
	serialize :arydrag
end
