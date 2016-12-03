def find_second_location
  puts "What is your puzzle input?"
  input = gets.chomp
  commands = input.split(", ")

  direction = %w(N E S W)
  current_x = 0
  current_y = 0
  previous_locations = []

  commands.each do |command|
    turn = command.slice! 0
    blocks = command.to_i
    turn == "R" ? direction.rotate! : direction.rotate!(-1)
    1..blocks.times do
      case direction.first
        when "N" then current_y += 1
        when "E" then current_x += 1
        when "S" then current_y -= 1
        when "W" then current_x -= 1
      end
      current_location = [current_x, current_y]
      if previous_locations.include?(current_location)
        total = current_x.abs + current_y.abs
        return "Easter Bunny Headquarters is #{total} blocks away."
      else
        previous_locations << current_location
      end
    end
  end
end

puts find_second_location

