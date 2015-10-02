module PostsHelper

	# def get_recent_tweets( options={} )
	# 	tweets_arr = options.fetch(:tweets_arr) rescue raise("PostsHelper::get_recent_tweets needs active record relations or array of tweets or posts")
	# 	how_many   = options.fetch(:how_many) { 10 }

	# 	return hamlize{ "%h3 There is no tweets." } if tweets_arr.empty?

	# 	# tweets_arr.each do |tweet|
	# 	# %p
	# 	#   =tweet.content
	# 	#   %br
	# 	#   posted at
	# 	#   = time_ago_in_words(tweet.created_at) 
	# 	#   ago by
	# 	#   = link_to(tweet.user.name, tweet.user)
	# 	# end
		
	# end

end
