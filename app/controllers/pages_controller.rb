class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @plants = Plant.all
  end

  def about
  end

  def login
  end
end
