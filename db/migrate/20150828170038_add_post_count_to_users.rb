class AddPostCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :post_count, :integer
  end
end
