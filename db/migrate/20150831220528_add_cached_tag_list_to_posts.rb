class AddCachedTagListToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cached_tag_list, :string
    Post.reset_column_information
    # next line makes ActsAsTaggableOn see the new column and create cache methods
    ActsAsTaggableOn::Taggable::Cache.included(Post)
    Post.find_each(batch_size: 1000) do |p|
      p.tag_list # it seems you need to do this first to generate the list
      p.save!
    end #https://github.com/mbleigh/acts-as-taggable-on/wiki/Caching
  end
end
