class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to new_tweet_path, notice: 'ツイートを作成しました'
    else
      flash.now[:notice] = 'ツイート作成失敗'
      render :new
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to edit_tweet_path(@tweet), notice: 'ツイートを更新しました'
    else
      flash.now[:notice] = 'ツイート更新失敗'
      render :edit
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
