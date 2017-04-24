class QunsController < ApplicationController
  before_action :authenticate_user! , only: [:new]

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
    if @qun.save
      redirect_to quns_path
    else
      render :new
    end
  end

  def edit
    @qun = Qun.find(params[:id])
  end

   def update
     @qun = Qun.find(params[:id])
     if @qun.update(qun_params)
       redirect_to quns_path, notice: "Update Success"
     else
       render :edit
     end
   end

  def destroy
    @qun = Qun.find(params[:id])
    @qun.destroy
    flash[:alert] = "Qun deleted"
    redirect_to quns_path
  end

  private

  def qun_params
    params.require(:qun).permit(:title, :description)
  end
end
