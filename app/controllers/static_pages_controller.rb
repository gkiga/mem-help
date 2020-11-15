class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
    respond_to do |format|
      format.html { render :home }
      
    end
  end

  def profile
    respond_to do |format|
      format.html { render :profile }
    end
  end

  def about
    respond_to do |format|
      format.html { render :about }
    end
  end

end
