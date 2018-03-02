# -*- encoding : utf-8 -*-
class AddAttemptsToMessages < ActiveRecord::Migration

  def self.up
    add_column :messages, :attempts, :integer, :default => 0
  end

  def self.down
    remove_column :messages, :attempts
  end

end
