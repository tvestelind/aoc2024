module Day2
  module_function

  def part1(input)
    input
      .lines
      .map { _1.split(/\s/).map(&:to_i) }
      .map do |report|
        report.each_cons(2).all? { |a, b| (a - b).abs in 1..3 } &&
          (
            report.each_cons(2).all? { |a, b| a > b } ||
              report.each_cons(2).all? { |a, b| a < b }
          )
      end
      .count(true)
  end

  def part2(input)
    input
      .lines
      .map { _1.split(/\s/).map(&:to_i) }
      .map do |report|
        report.map.with_index do |_, i|
          report[0...i] + report[i + 1..-1]
        end
          .map do |r|
            r.each_cons(2).all? { |a, b| (a - b).abs in 1..3 } &&
              (
                r.each_cons(2).all? { |a, b| a > b } ||
                  r.each_cons(2).all? { |a, b| a < b }
              )
          end
          .any?
      end
      .count(true)
  end
end
