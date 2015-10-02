class AddFolloweeCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :followee_count, :integer, default: 0
  end
end
