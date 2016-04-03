class AddAttachmentPhototoDevelopers < ActiveRecord::Migration
    def self.up
    change_table :developers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :developers, :photo
  end
end
