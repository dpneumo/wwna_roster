class Link < ApplicationRecord
	belongs_to :house
	belongs_to :lot, class_name: 'House'
end
