class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar_movies(title)
    movie = Movie.find_by(title: title)
    return nil if movie.nil?
    return nil if movie.director.nil? or movie.director.blank? 
    Movie.where(director: movie.director).pluck(:title) # pluck returns a list of attributes so you don't need to actually load a bunch of records
  end
end
