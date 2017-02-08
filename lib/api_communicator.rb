require 'rest-client'
require 'json'
require 'pry'
require_relative "../lib/command_line_interface.rb"

FILMNUMS = {"The Phantom Menace" => 1,
            "Attack of the Clones" => 2,
            "Revenge of the Sith" =>3,
            "A New Hope" => 4,
            "The Empire Strikes Back" => 5,
            "Return of the Jedi" => 6,
            "The Force Awakens" => 7}

def get_character_movies_from_api(character)
  films = []
  merged_char_arr.each do |char_hash|
    #binding.pry
    if char_hash["name"].downcase.include? character.downcase
      puts "#{char_hash["name"]} has been in the following films:"
      films += char_hash["films"]
    end
  end
  invalid_input(films)
end

def parse_character_movies(films_hash_array)
  sorted_films = films_hash_array.sort_by{|k,v| k["episode_id"]}.uniq
  sorted_films.each do |movie, i|
    puts "Ep. #{movie["episode_id"]} - #{movie["title"]}"
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
  url = "http://www.swapi.co/api/people/?page=1"
  begin
    pg_characters = RestClient.get(url)
    pg_hash = JSON.parse(pg_characters)
    character_arr += pg_hash["results"]
    url = pg_hash["next"]
  end while url
  character_arr
end

def invalid_input(films)
  if films == []
    puts "Invalid character, please try again."
    character = get_character_from_user
    get_character_movies_from_api(character)
  else
    get_films_from_api(films)
  end
end
