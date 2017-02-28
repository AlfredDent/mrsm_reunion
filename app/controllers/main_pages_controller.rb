class MainPagesController < ApplicationController
  
  def home
    @detail = Detail.new
  end
  
end
