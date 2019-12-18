class LikesController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    Like.create(user_id: current_user.id, tweet_id: tweet.id)
    # current_user.likes.create(tweet_id: tweet.id)
    redirect_to tweets_path, notice: 'いいねしました'
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to tweets_path, notice: 'いいねを取り消しました'
  end
end
