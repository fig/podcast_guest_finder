class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :show, foreign_key: true, null: false
      t.string :name, null: false
      t.string :link
      t.text :description
      t.text :show_notes
      t.string :published_at
      t.string :audio_file_url

      t.timestamps
    end

    add_index :episodes, [:show_id, :name], unique: true
  end
end
