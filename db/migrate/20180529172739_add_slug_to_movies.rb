class AddSlugToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :slug, :string
  end
end
