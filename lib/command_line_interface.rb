require_relative "../lib/api_communicator.rb"

def welcome
  puts %q[
                              Welcome to the
           _________________      ____         __________
          /                 |    /    \    .  |          \
         /    ______   _____| . /      \      |    ___    |     .     .
         \    \    |   |       /   /\   \     |   |___>   |
          \    \   |   |      /   /__\   \  . |         _/               .
   ________>    |  |   | .   /            \   |   |\    \_______    .
  |            /   |   |    /    ______    \  |   | \           |
  |___________/    |___|   /____/      \____\ |___|  \__________|    .
   ____     __  . _____   ____      .  __________   .  _________
   \    \  /  \  /    /  /    \       |          \    /         |      .
    \    \/    \/    /  /      \      |    ___    |  /    ______|  .
     \              /  /   /\   \ .   |   |___>   |  \    \
   .  \            /  /   /__\   \    |         _/.   \    \            +
       \    /\    /  /            \   |   |\    \______>    |   .
        \  /  \  /  /    ______    \  |   | \              /          .
   .     \/    \/  /____/      \____\ |___|  \____________/  LS
                    .                                        .

                    Character Movie Database!!!
  ]
end

def get_character_from_user
  puts "Please enter a character's name (or exit to quit):"
  character = gets.chomp
end

def goodbye(character)
  abort("May the Force be with you!") unless character != "exit"
end
