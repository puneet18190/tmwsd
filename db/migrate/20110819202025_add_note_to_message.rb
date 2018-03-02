# -*- encoding : utf-8 -*-
class AddNoteToMessage < ActiveRecord::Migration

  def self.up
    add_column :messages, :note, :text
  end

  def self.down
    remove_column :messages, :note
  end

end
