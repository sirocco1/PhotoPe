class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :animal_genre
      t.string :image
      t.string :video
      t.text :description
      t.timestamps
    end
  end
end
