class QunsController < ApplicationController
  def index
  @quns = Qun.all
end
end
