class Link < ApplicationRecord
	belongs_to :house
	belongs_to :lot, class_name: 'House'  #, foreign_key: :lot_id
end
