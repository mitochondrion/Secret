class ZecretsController < ApplicationController
  def show
    @zecret = Zecret.find(params[:id])
  end

  def create
    @zecret = Zecret.create(params[:zecret])

    redirect_to @zecret
  end

  def retrieve
    @zecret = Zecret.find(params[:zecret_id])
    render "show"
  end
end
