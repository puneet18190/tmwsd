# -*- encoding : utf-8 -*-
class AddLastAccessedAtToMessages < ActiveRecord::Migration

  def self.up
    add_column :messages, :last_accessed_at, :datetime
  end

  def self.down
    remove_column :messages, :last_accessed_at
  end

end
