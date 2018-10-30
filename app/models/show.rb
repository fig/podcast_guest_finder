class Show < ApplicationRecord
  validates :name, presence: true
  validates :xml_feed_url, presence: true
end
