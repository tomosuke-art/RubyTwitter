class TweetsController < ApplicationController
  def index
    
  end

  def new
    @tweet = Tweet.new #Tweetの内容をまとめている情報
    # @ をつけることでviewsで使用できる
  end

  # def create
  #   @tweet = Tweet.new(tweet_params)  #代入
  #   if @tweet.save
  #     redirect_to root_path
  #   else 
  #     redirect_to tweets_new_path
  #   end
  # end

  # private
  # def tweet_params
  #   params.require(:tweet).permit(:body)
  # end
  def create
    @tweet = Tweet.new(tweet_params) # フォームに入力された情報をもとにtweetを生成
    if @tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  private
  def tweet_params # 受け取りたい情報だけに絞り込んでいる
    params.permit(:body)
    # require(:tweet) -> 不要
  end
end
