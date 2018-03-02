# -*- encoding : utf-8 -*-
class AddAccessedAtToMessageUrls < ActiveRecord::Migration

  def self.up
    add_column :message_urls, :accessed_at, :datetime
  end

  def self.down
    remove_column :message_urls, :accessed_at
  end

end
