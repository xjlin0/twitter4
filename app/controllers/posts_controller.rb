class PostsController < ApplicationController
  before_action :set_post, only: [:vote, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:vote, :create, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = params[:tag_id].nil? ? Post.includes(:user).last(10) : Post.includes(:user).tagged_with(ActsAsTaggableOn::Tag.find(params[:tag_id]))
  end

  

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def create
    @post = Post.new(post_params)
    hash_tags = @post.content.scan(/\B#\w*[a-zA-Z]+\w*/)  #http://erictarn.com/post/1060722347
    @post.save_cached_tag_list
    @post.tag_list.add(hash_tags)

    if @post.save
      flash.notice = "Your tweet is successfully created"
    else
      flash.alert =  "You've got some errors in your post, say, too long?" # <%= debug(params) if Rails.env.development? %>
    end
    redirect_to request.env['HTTP_REFERER']
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update #
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote    # GET /posts/:id/vote.json
      vote_count = case params[:vote]
      when 'Up'
        @post.upvote_by(current_user)
        @post.cached_votes_up
      when 'Down'
        @post.downvote_by(current_user)
        @post.cached_votes_down
      end

      respond_to do |format|
        format.html { render file: 'public/404', status: 404 }
        format.json { render json: {vote_count: vote_count}, status: 200 }
      end
  end # authorization by Devise' #before_action

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :user_id, :tag_list, :tag_id, :vote)
  end
end
