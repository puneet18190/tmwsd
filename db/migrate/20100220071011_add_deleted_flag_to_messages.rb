# -*- encoding : utf-8 -*-
class AddDeletedFlagToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :deleted, :boolean
  end

  def self.down
    remove_column :messages, :deleted
  end
end
