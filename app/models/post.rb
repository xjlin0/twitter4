class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: :post_count

  validates :content, presence: true
  validates :user_id, presence: true
  validates_length_of :content, maximum: 140

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :hashtags

  acts_as_votable

	# def self.search(options = {})
	# 	search_term = options.fetch(:content) {nil}
	# 	return [] if search_term.nil?
	#   where("content LIKE :term", term: "%#{search_term}%")
	#   #ILIKE is postgres only, http://stackoverflow.com/questions/19105706
	# end
end