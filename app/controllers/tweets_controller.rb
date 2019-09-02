class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
  @tweets = Tweet.all
  end

  def new
    
  end

  def create
    Tweet.create(tweet_params)
    # Tweet.create(tweet_params)
    redirect_to action: 'index'
  end

  def destroy
  tweet = Tweet.find(params[:id])
  tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
      @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    redirect_to action: 'index'
  end

  private

  def tweet_params
  params.permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
  redirect_to action: :index unless user_signed_in?
  end

end
