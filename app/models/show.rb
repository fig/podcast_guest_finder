class Show < ApplicationRecord
  has_many :episodes
  validates :name, presence: true
  validates :xml_feed_url,
    presence: true,
    format: URI::regexp(%w(http https))
end
