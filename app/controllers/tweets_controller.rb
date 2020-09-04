class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all # 全てのtweetを取得
  end

  def new
    @tweets = Tweet.new #Tweetの内容をまとめている情報
    # @ をつけることでviewsで使用できる
  end

  def create
    @tweets = Tweet.new(tweet_params) # フォームに入力された情報をもとにtweetを生成
    if @tweets.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    #一覧ページから送られてきたidに対応するツイートをデータベースから取得
    @tweets = Tweet.find(params[:id]) 
  end

  def edit
    @tweets = Tweet.find(params[:id])
  end

  def update 
    @tweets = Tweet.find(params[:id])
    if @tweets.update(tweet_params)
      redirect_to :action => "show" , :id => @tweets.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to :action => "index"
  end

  private
  def tweet_params # 受け取りたい情報だけに絞り込んでいる
    params.permit(:body)
    # require(:tweet) -> 不要
  end
end
