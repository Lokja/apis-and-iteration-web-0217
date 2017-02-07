def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Character Movie Database!!!"
end

def get_character_from_user
  puts "please enter a character's name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
end
