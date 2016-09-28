class HomeController < ApplicationController
    before_action :authenticate_user!, only: :show

  def index
    if user_signed_in?
      @note = Tweet.new
      @notes = Tweet.all
      redirect_to tweets_path
    end
  end

  def show
  end
end
