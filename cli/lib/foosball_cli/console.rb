require 'foosball_cli'

while (print '> '; input = gets) do
  input.chomp!
  case input
  when 'time' then puts Time.now
  when 'version' then puts FoosballCli::VERSION
  when 'q', 'quit', 'exit' then break
  else puts 'Unknown command'
  end
end
