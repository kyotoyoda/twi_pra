class UsersController < ApplicationController


def index
  @users = User.all
end

  def show
  @user = User.find(params[:id])
  @tweets = Tweet.where(user_id: @user.id)
  end

<<<<<<< HEAD
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end




=======
>>>>>>> origin/master
end
