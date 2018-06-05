class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_item_count
    @contents.values.sum
  end

  def add_movie(movie)
    if @contents[movie.id.to_s]
      @contents[movie.id.to_s] += 1
    else
      @contents[movie.id.to_s] = 1
    end
  end

  def item_count(id)
    @contents[id]
  end
end
