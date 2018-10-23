class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :shows, :name, unique: true
  end
end
