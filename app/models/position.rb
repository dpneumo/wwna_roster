class Position < ApplicationRecord
  belongs_to :person

  Officers = %w[ President 'Vice President' Secretary Treasurer ]
  Chairs = %w[ Landscape Social Security 'New Member' ]
end
