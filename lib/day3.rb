module Day3
  module_function

  def part1(input)
    input
      .scan(/mul\((\d{1,3}),(\d{1,3})\)/)
      .map { |a, b| a.to_i * b.to_i }
      .sum
  end

  def part2(input)
    input
      .gsub(/\n/, "")
      .gsub(/don't\(\).*?do\(\)/, "")
      .gsub(/don't\(\).*$/, "")
      .then { part1(_1) }
  end
end
