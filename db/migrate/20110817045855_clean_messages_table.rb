# -*- encoding : utf-8 -*-
class CleanMessagesTable < ActiveRecord::Migration

  def self.up
    remove_column :messages, :url
    remove_column :messages, :recipient_ip_address
    remove_column :messages, :recipient_country
    remove_column :messages, :recipient_state
    remove_column :messages, :recipient_province
    remove_column :messages, :recipient_city
    remove_column :messages, :attempts
  end

  def self.down
    add_column :messages, :attempts, :integer,             :default => 0
    add_column :messages, :recipient_city, :string
    add_column :messages, :recipient_province, :string
    add_column :messages, :recipient_state, :string
    add_column :messages, :recipient_country, :string
    add_column :messages, :recipient_ip_address, :string
    add_column :messages, :url, :string
  end

end
