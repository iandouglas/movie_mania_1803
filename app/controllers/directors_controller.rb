class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def create
    Director.create(director_params)
    redirect_to directors_path
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end

end
