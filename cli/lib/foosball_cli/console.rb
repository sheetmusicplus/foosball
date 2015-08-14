require 'foosball_cli'

def print_all_players
  _, players = FoosballCli.all_players
  players.each do |player|
    puts "#{player.name} \##{player.id}"
  end
end

while (print '> '; input = gets) do
  input.chomp!
  case input
  when 'players' then print_all_players
  when 'time' then puts Time.now
  when 'version' then puts FoosballCli::VERSION
  when 'q', 'quit', 'exit' then break
  else puts 'Unknown command'
  end
end
