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

  decrypted = existing.map { |room| decrypt(room: room) }
  decrypted.select { |room| room[0].include?("northpole object storage") }
end

def decrypt(room:)
  alphabet = ("a".."z").to_a
  shift = room[1].to_i % 26
  shifted_alphabet = alphabet.rotate(shift)
  name = room[0].each_char.map { |char| char == "-" ? " " : shifted_alphabet[alphabet.index(char)] }.join
  [name, room[1], room[2]]
end

puts count_rooms(lines: receive_puzzle_input)
