class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    movie = Movie.find(params[:movie_id])
    @cart.add_movie(movie)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.item_count(movie.id.to_s), movie.title)} in your cart."
    redirect_to movies_path
  end
end
