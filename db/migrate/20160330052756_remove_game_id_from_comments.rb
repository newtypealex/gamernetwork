class RemoveGameIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :game_id
  end
end
