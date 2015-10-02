class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.includes(:fans).find(params[:user_id])
    @user.fans << current_user
    redirect_to user_path(params[:user_id])
    #redirect_to request.env['HTTP_REFERER']
  end

  def index
  end

  def destroy
    @user = User.includes(:fans).find(params[:user_id])
    @user.fans.delete(current_user)
    redirect_to user_path(params[:user_id])
    #format.html { redirect_to controller: 'users', aciton: 'show', id: user_id }
  end
end
