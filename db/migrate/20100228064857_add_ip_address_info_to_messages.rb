# -*- encoding : utf-8 -*-
class AddIpAddressInfoToMessages < ActiveRecord::Migration

  def self.up
    add_column :messages, :sender_ip_address, :string
    add_column :messages, :sender_country, :string
    add_column :messages, :sender_state, :string
    add_column :messages, :sender_province, :string
    add_column :messages, :sender_city, :string
    add_column :messages, :recipient_ip_address, :string
    add_column :messages, :recipient_country, :string
    add_column :messages, :recipient_state, :string
    add_column :messages, :recipient_province, :string
    add_column :messages, :recipient_city, :string
  end

  def self.down
    remove_column :messages, :recipient_city
    remove_column :messages, :recipient_province
    remove_column :messages, :recipient_state
    remove_column :messages, :recipient_country
    remove_column :messages, :recipient_ip_address
    remove_column :messages, :sender_city
    remove_column :messages, :sender_province
    remove_column :messages, :sender_state
    remove_column :messages, :sender_country
    remove_column :messages, :sender_ip_address
  end

end
