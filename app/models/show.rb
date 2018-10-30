class Show < ApplicationRecord
  validates :name, presence: true
  validates :xml_feed_url,
    presence: true,
    format: URI::regexp(%w(http https))
end
