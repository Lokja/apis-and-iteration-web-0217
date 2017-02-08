#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome

def runner
  character = get_character_from_user
  goodbye(character)
  show_character_movies(character)
  runner
end

runner
