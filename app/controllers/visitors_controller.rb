class VisitorsController < ApplicationController

	def index
		@posts = Post.includes(:user).reverse_order.first(10)
	end

end
