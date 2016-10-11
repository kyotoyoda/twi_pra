class RelationshipsController < ApplicationController

  def create
	   user_id = params[:user_id]
		if Relationship.create(following_id: current_user.id, follower_id: user_id)
			redirect_to user_path(user_id), notice: "フォローしました"
		else
			redirect_to tweets_url, notice: "フォローできません"
		end
	end

	def destroy
    user_id = params[:user_id]
   if Relationship.find_by(following_id: current_user.id, follower_id: user_id).destroy
		redirect_to user_path(user_id), notice:"フォロー解除しました"
	end
end


#  def create
#    @user = User.find(params[:relationship][:following_id])
#    current_user.follow(@user)
#    redirect_to user_path(@user.id)
#  end

#  def destroy
#    @user = Relationship.find(params[:id]).followed
#    current_user.unfollow(@user)
#    redirect_to user_path(@user.id)
#  end

#  def create
#    @user = User.find(params[:relationship][:following_id])
#    current_user.follow(@user)
#    respond_to do |format|
#      format.html { redirect_to @user }
#      format.js
#    end
#  end

#  def destroy
#    @user = Relationship.find(params[:id]).following
#    current_user.unfollow(@user)
#    respond_to do |format|
#      format.html { redirect_to @user }
#      format.js
#    end
#  end
end
