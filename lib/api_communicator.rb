require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

  films = []
  merged_char_arr.each do |char_hash|
      # binding.pry
      # puts character
    if char_hash["name"].downcase == character.downcase
      puts "#{char_hash["name"]} has been in the following films:"
      films = char_hash["films"]
    end
  end

  get_films_from_api(films)
end

def parse_character_movies(films_hash_array)
  films_hash_array.each.with_index(1) do |movie, i|
    puts "-- #{movie["title"]}"
  end
end

def show_character_movies(character)
  films_hash_array = get_character_movies_from_api(character)
  parse_character_movies(films_hash_array)
end

def get_films_from_api(films_array)
  films_array.map do |film|
    film_req = RestClient.get(film)
    film_hash = JSON.parse(film_req)
  end
end

def merged_char_arr
  character_arr = []
  i = 1
  9.times do
    all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{i}")
    pg_hash = JSON.parse(all_characters)
    # binding.pry
    character_arr << pg_hash["results"]
    i += 1
  end
  character_arr.flatten(1)
end
