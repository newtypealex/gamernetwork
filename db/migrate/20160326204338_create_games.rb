class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.string :launch_date

      t.timestamps null: false
    end
  end
end
