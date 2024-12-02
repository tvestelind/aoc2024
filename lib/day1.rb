module Day1
  module_function

  def part1(input)
    input
      .lines
      .map { _1.split(/\s+/) }
      .transpose
      .map(&:sort)
      .reduce { _1.zip(_2).map { |x, y| x.to_i - y.to_i }}
      .map(&:abs)
      .sum
  end

  def part2(input)
    input
      .lines
      .map { _1.split(/\s+/) }
      .transpose
      .map { _1.map { |x| x.to_i }}
      .reduce do |left, right|
        right_tally = right.tally
        left.map { _1 * right_tally.fetch(_1, 0) }
      end
      .sum
  end
end
