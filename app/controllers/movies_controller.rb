class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = Movie.new
  end

  def create
    director = Director.find(params[:director_id])
    movie = director.movies.create(movies_params)
    redirect_to movie_path(slug: movie.slug)
  end

  def show
    @movie = Movie.find_by(slug: params[:slug])
  end

  private

  def movies_params
    params.require(:movie).permit(:title, :description)
  end
end
