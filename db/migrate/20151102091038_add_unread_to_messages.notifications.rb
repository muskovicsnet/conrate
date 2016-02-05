# This migration comes from notifications (originally 20151102090921)
class AddUnreadToMessages < ActiveRecord::Migration
  def change
    add_column :notifications_messages, :unread, :boolean, default: true
  end
end
