def receive_puzzle_input
  puts "Reading from file..."
  File.readlines("day4_input.txt").map(&:chomp)
end

def parse_line(line:)
  line.scan(/(.+)-(\d+)\[(.+)\]/).first
end

def count_rooms(lines:)
  parsed = lines.map { |line| parse_line(line: line) }
  existing = parsed.select do |line|
    counts = ("a".."z").map { |char| [char, line[0].count(char)] }
    sorted_counts = counts.sort_by { |char, count| [-count, char] }
    top_five = sorted_counts.first(5).map { |count| count[0] }.join
    top_five == line[2]
  end
  sum = existing.map { |line| line[1].to_i }.reduce(:+)
  "The total of existing rooms is #{sum}."
end

puts count_rooms(lines: receive_puzzle_input)
