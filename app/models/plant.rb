class Plant < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
