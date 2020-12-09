class InfosController < ApplicationController
  before_action :authenticate_user!,　except: [:index]

  def index
    @info = Info.new
  end

  
end
