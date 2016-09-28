class LikesController < ApplicationController
 def like
   tweet = Tweet.find(params[:tweet_id])
   like = current_user.likes.build(tweet_id: tweet.id)
   like.save
   redirect_to tweet


 end

 def unlike
   tweet = Tweet.find(params[:tweet_id])
   like = current_user.likes.build(tweet_id: tweet.id)
   like.destroy
   redirect_to tweet
 end


end
