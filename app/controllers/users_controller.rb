class UsersController < ApplicationController


def index
  @users = User.all
end

  def show
  user = current_user
  @user = User.find(params[:id])
  @users = @user.followings
  @tweets = @user.tweets
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @relationships = Relationship.all
    @followings = @relationships.where(following_id: @user.id)
    @users = User.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @relationships = Relationship.all
    @followers = @relationships.where(follower_id: @user.id)
    @users = User.all
    render 'show_follower'
  end



end
