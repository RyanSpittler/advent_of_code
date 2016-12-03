def receive_puzzle_input
  lines = []
  puts "Please enter a line of puzzle input. Type 'end' to finish entering lines of commands."
  while true
    line1 = gets.chomp
    break if line1 == "end"
    line2 = gets.chomp
    line3 = gets.chomp
    right_array = [line1.split(" ").map(&:to_i), line2.split(" ").map(&:to_i), line3.split(" ").map(&:to_i)].transpose
    lines += right_array
  end
  lines
end

def count_triangles(lines:)
  lines.select do |line|
    line[0] + line[1] > line[2] &&
    line[0] + line[2] > line[1] &&
    line[0] < line[1] + line[2]
  end.count
end

puts count_triangles(lines: receive_puzzle_input)
