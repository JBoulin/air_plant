class PagesController < ApplicationController
  def home
    @plants = Plant.all
  end

  def about
  end

  def login
  end
end
