require 'rails_helper'

describe Cart do
  describe 'instance methods' do
    it 'total_item_count' do
      cart = Cart.new({'1' => 1, '2' => 3})

      expect(cart.total_item_count).to eq(4)
    end

    it 'add_movie' do
      director = Director.create!(name: 'Someone!')
      movie = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
      cart = Cart.new(nil)
      id_string = movie.id.to_s

      expect(cart.contents[id_string]).to eq(0)
      cart.add_movie(movie)

      expect(cart.contents[id_string]).to eq(1)
    end

    it 'item_count' do
      cart = Cart.new({'1' => 1, '2' => 3})

      expect(cart.item_count('1')).to eq(1)
      expect(cart.item_count('2')).to eq(3)
    end
  end
end
