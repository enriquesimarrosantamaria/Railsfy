class PagesController < ApplicationController

  #Código back-end para pages/index
  def index
  end

  def home
  end

  def profile
    #Grab the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found"
    end
  end

  def explore
  end
end
