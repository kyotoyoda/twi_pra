class LikesController < ApplicationController
 def like
   tweet = Tweet.find(params[:tweet_id])
   like = current_user.likes.build(tweet_id: tweet.id)
   like.save
   redirect_to tweet


 end

 def unlike
   tweet = Tweet.find(params[:tweet_id])# あるidをもつツイートを持ってくる
   like = current_user.likes.find_by(tweet_id: tweet.id)# like=前述のツイートのlikeであるとする
   like.destroy
   redirect_to tweet
 end


end
