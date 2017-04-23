class QunsController < ApplicationController
  def index
    @quns = Qun.all
  end

  def new
    @qun = Qun.new
  end

end
