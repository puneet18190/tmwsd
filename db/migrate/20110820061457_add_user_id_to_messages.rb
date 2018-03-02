# -*- encoding : utf-8 -*-
class AddUserIdToMessages < ActiveRecord::Migration

  def self.up
    add_column :messages, :user_id, :integer
  end

  def self.down
    remove_column :messages, :user_id
  end

end
