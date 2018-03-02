# -*- encoding : utf-8 -*-
class CreateMessageUrls < ActiveRecord::Migration

  def self.up
    create_table :message_urls do |t|
      t.integer :message_id
      t.string :url
      t.string :recipient_ip_address
      t.string :recipient_country
      t.string :recipient_state
      t.string :recipient_province
      t.string :recipient_city
      t.integer :attempts, :default => 0
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :message_urls
  end

end
