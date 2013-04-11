class ZecretsController < ApplicationController
  respond_to :html

  def show
    @zecret = Zecret.find(params[:id])
  end

  def create
    @zecret = Zecret.create(params[:zecret])
    respond_with @zecret
  end

  def retrieve
    @zecret = Zecret.find_by_id(params[:zecret_id])

    if @zecret
      redirect_to @zecret
    else
      flash.alert = "INVALID ZECRET ID!"
      redirect_to root_path
    end
  end
end
