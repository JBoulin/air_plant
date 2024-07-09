class Plant < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
