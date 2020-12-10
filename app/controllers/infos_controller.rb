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
      render :new
    end
  end



  private
  def info_params
    params.require(:info).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
  
end
