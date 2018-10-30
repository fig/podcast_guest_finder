class AddXmlFeedUrlToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :xml_feed_url, :string, null: false
    add_index :shows, :xml_feed_url, unique: true
  end
end
