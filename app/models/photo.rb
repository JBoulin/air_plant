class Photo < ApplicationRecord
  belongs_to :plant
  has_one_attached :image
end
