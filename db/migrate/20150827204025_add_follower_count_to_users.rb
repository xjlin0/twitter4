class AddFollowerCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follower_count, :integer, default: 0
  end
end
