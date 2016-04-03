class CreateUserPlatforms < ActiveRecord::Migration
  def change
    create_table :user_platforms do |t|
      t.integer :user_id
      t.integer :platform_id

      t.timestamps null: false
    end
  end
end
