require 'rails_helper'

describe 'add movie to cart' do
  before(:each) do
    director = Director.create!(name: 'Someone!')
    @movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
    @movie2 = director.movies.create!(title: 'Mary Poppins', description: 'Tim Robbins in jail')
    @button_label = 'Add this movie to cart'

  end
  context 'user visits movies index' do
    it 'should be able to add movie to cart' do
      visit movies_path

      within("#movie_#{@movie1.id}") do
        click_on @button_label
      end

      expect(current_path).to eq(movies_path)
      expect(page).to have_content("You now have 1 #{@movie1.title} in your cart.")
    end

    it 'adds multiple of the same movie to the cart' do
      visit movies_path

      within("#movie_#{@movie1.id}") do
        click_on @button_label
      end

      expect(page).to have_content("You now have 1 #{@movie1.title} in your cart.")

      within("#movie_#{@movie1.id}") do
        click_on @button_label
      end

      expect(page).to have_content("You now have 2 #{@movie1.title}s in your cart.")
    end

    it 'displays total number of items in cart' do
      visit movies_path

      expect(page).to have_content('Cart: 0')

      within("#movie_#{@movie1.id}") do
        click_on @button_label
      end

      within("#movie_#{@movie2.id}") do
        click_on @button_label
      end

      expect(page).to have_content("You now have 1 #{@movie2.title} in your cart.")
      expect(page).to have_content('Cart: 2')
    end
  end
end
