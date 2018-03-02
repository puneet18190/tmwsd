# -*- encoding : utf-8 -*-
class AddNameAndEmailToMessageUrls < ActiveRecord::Migration

  def self.up
    add_column :message_urls, :name, :string
    add_column :message_urls, :email, :string
  end

  def self.down
    remove_column :message_urls, :email
    remove_column :message_urls, :name
  end

end
