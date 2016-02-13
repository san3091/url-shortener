class UrlController < ApplicationController

  def new
    @urls = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url } 
        format.all { render plain: "We only support HTML", status: :not_acceptable }
      else
        format.html { render :new }
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:user_url, :id)
  end
end
