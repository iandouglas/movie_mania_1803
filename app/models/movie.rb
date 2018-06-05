class Movie < ApplicationRecord
  belongs_to :director
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end
end
