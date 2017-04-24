class QunsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

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
    @qun.user = current_user
    if @qun.save
      redirect_to quns_path
    else
      render :new
    end
  end

  def edit
    find_qun_and_check_permission
  end

   def update
     find_qun_and_check_permission
     if @qun.update(qun_params)
       redirect_to quns_path, notice: "Update Success"
     else
       render :edit
     end
   end

  def destroy
    find_qun_and_check_permission
    @qun.destroy
    redirect_to quns_path, alert: "Qun deleted"
  end

  private
  def find_qun_and_check_permission
    @qun = Qun.find(params[:id])

    if current_user != @qun.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def qun_params
    params.require(:qun).permit(:title, :description)
  end
end
