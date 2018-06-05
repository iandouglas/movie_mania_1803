require 'rails_helper'

describe "user sees one movie" do
  it "user sees one with title and description" do
    director = Director.create(name: 'George Lucas')
    movie = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')

    visit movie_path(movie.slug)

    expect(current_path).to eq("/movies/#{movie.slug}")

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
end
