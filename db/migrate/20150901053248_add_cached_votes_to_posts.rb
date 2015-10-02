class AddCachedVotesToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cached_votes_up, :integer, default: 0
    add_column :posts, :cached_votes_down, :integer, default: 0
    add_index :posts, :cached_votes_up
    add_index :posts, :cached_votes_down
    #Post.find_each(&:update_cached_votes)
  end

	def self.down
    remove_column :posts, :cached_votes_up
    remove_column :posts, :cached_votes_down
	end

end
