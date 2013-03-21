class ZecretsController < ApplicationController
  def show
    @zecret = Zecret.find(params[:id])
  end

  def create
    params[:zecret][:title] = "NEW SECRET"
    params[:zecret][:body] = "#{Time.now}"

    @zecret = Zecret.create(params[:zecret])

    redirect_to @zecret
  end

  def index
  end
end
