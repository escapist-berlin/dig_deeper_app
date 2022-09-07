class Release < ApplicationRecord
  belongs_to :list
  has_one_attached :photo
  has_many :tracks, dependent: :destroy

  validates :artist, :title, presence: true
end
