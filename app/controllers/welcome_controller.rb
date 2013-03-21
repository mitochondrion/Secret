class WelcomeController < ApplicationController
  def index
    @zecret = Zecret.new
  end
end
