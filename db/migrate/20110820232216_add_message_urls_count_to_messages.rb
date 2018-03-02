# -*- encoding : utf-8 -*-
class AddMessageUrlsCountToMessages < ActiveRecord::Migration

  def self.up
    add_column :messages, :message_urls_count, :integer, :default => 0
  end

  def self.down
    remove_column :messages, :message_urls_count
  end

end
