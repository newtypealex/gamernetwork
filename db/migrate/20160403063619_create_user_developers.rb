class CreateUserDevelopers < ActiveRecord::Migration
  def change
    create_table :user_developers do |t|
      t.integer :user_id
      t.integer :developer_id

      t.timestamps null: false
    end
  end
end
