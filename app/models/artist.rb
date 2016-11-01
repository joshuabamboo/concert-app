class Artist < ApplicationRecord
  has_many :user_artists, dependent: :destroy
  has_many :users, through: :user_artists
end