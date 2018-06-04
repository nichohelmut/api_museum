class MuseumsController < ApplicationController

  def index
    @museums = Museum.all
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(params[:museum])
    @museum.save

  end


end

