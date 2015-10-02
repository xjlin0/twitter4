class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:idols).find(params[:id]) #eager loading
    @posts = Post.includes(:user).where(user_id: @user.idols.pluck(:id) + [@user.id] ).last(10)
    @hot_tags = ActsAsTaggableOn::Tag.most_used(10)
     #Get all posts from user and user's idols
    # unless @user == current_user
    #    redirect_to :back, alert: "Access denied." rescue redirect_to user_path
    # end
    #@post = Post.new #for form_for post
  end

  def search    # GET /search/term.json
    term     = params[:term]
    @results = term.nil? ? [] : User.search(name: term) + Post.tagged_with(term)
    respond_to do |format|
      format.html { render file: 'public/404', status: 404 }
      format.json { render json: @results, status: 200 }
    end
  end  # Search results get no ranking here

end
