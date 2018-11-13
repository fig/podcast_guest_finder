class Show < ApplicationRecord
  has_many :episodes
  validates :name, presence: true
  validates :xml_feed_url,
    presence: true,
    format: URI::regexp(%w(http https))

  def save_and_parse!(xml_feed_contents)
    save!

    PodcastRSSFile.new(
      show: self,
      contents: xml_feed_contents
    ).consume!
  end
end
