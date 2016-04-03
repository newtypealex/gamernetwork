class AddAttachmentPhototoPlatforms < ActiveRecord::Migration
  def self.up
    change_table :platforms do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :platforms, :photo
  end
end
