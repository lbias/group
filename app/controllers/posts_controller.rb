class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @qun = Qun.find(params[:qun_id])
    @post = Post.new
  end

  def create
    @qun = Qun.find(params[:qun_id])
    @post = Post.new(post_params)
    @post.qun = @qun
    @post.user = current_user

    if @post.save
      redirect_to qun_path(@qun)
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
