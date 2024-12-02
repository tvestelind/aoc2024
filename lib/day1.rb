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
end
