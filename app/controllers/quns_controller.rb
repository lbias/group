class QunsController < ApplicationController
  def index
    @quns = Qun.all
  end

  def show
    @qun = Qun.find(params[:id])
  end

  def new
    @qun = Qun.new
  end

  def create
    @qun = Qun.new(qun_params)
    @qun.save

      redirect_to quns_path
  end

  private

  def qun_params
    params.require(:qun).permit(:title, :description)
  end
end
