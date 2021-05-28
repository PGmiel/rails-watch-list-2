# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all

require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'
link = URI.open(url).read
list = JSON.parse(link)
list["results"].each do |result|
  Movie.create(
    title: result['title'],
    overview: result['overview'],
    poster_url: result['poster_path'],
    rating: result['vote_average']
  )
end

5.times do
  List.create(
    name: Faker::Book.genre
  )
end
