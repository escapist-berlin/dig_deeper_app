class Release < ApplicationRecord
  belongs_to :list
  has_one_attached :photo
end
