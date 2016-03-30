class DropUserComments < ActiveRecord::Migration
  def change
    drop_table :user_comments
  end
end