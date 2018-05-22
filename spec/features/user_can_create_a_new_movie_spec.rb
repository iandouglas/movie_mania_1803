require 'rails_helper'

describe 'Visitor' do
  it 'should create a new movie with a director resource' do
    director = Director.create(name: 'Patty Jenkins')
    movie_title = 'Wonder Woman'
    description = 'Before she was Wonder Woman, she was Diana.'

    visit "/directors/#{director.id}/movies/new"
    # visit new_director_movie_path(director)

    fill_in :movie_title, with: movie_title
    fill_in :movie_description, with: description
    click_on 'Create Movie'

    expect(current_path).to eq("/movies/#{Movie.last.id}")

    expect(page).to have_content(director.name)
    expect(page).to have_content(movie_title)
    expect(page).to have_content(description)
  end
end
