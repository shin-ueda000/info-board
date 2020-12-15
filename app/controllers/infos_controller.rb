class InfosController < ApplicationController
  before_action :authenticate_user!,　except: [:index]

  def index
    @info = Info.all
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      redirect_to root_path
    else
      binding.pry
      render :new
    end
  end

  def show
    @info = Info.find(params[:id])
    @comment = Comment.new
    @comments = @info.comments.includes(:user)
  end

  def edit
    @info = Info.find(params[:id])
    unless current_user.id == @info.user_id
      redirect_to action: :index
    end
  end

  def update
    @info = Info.find(params[:id])
    if @info.update(info_params)
      redirect_to info_path 
    else
      render :edit
    end
  end

  def destroy
    info = Info.find(params[:id])
    info.destroy
    redirect_to root_path
  end


  private
  def info_params
    params.require(:info).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
  
end
