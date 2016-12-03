direction = ["N", "E", "S", "W"]
x = 0
y = 0

puts "What is your puzzle input?"
input = gets.chomp
commands = input.split(", ")

commands.each do |command|
  turn = command.slice!(0)
  turn == "R" ? direction.rotate! : direction.rotate!(-1)
  case direction.first
    when "N" then y += command.to_i
    when "E" then x += command.to_i
    when "S" then y -= command.to_i
    when "W" then x -= command.to_i
  end
end

total = x.abs + y.abs

puts "Easter Bunny Headquarters is #{total} blocks away."

