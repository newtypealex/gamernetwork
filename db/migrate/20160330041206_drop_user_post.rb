class DropUserPost < ActiveRecord::Migration
  def change
    drop_table :user_posts
  end
end
