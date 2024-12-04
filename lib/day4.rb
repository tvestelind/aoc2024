module Day4
  module_function

  def part1(input)
    input
      .lines
      .map(&:chomp)
      .map { _1.split(//) }
      .then do |matrix|
        matrix.each_with_index.sum do |row, y|
          row.each_with_index.sum { |cell, x| cell == "X" ? xmases(matrix, x, y) : 0 }
        end
      end
  end

  def xmases(matrix, x, y)
    raise "x and y must be an X" if matrix.dig(y, x) != "X"

    safe_dig = ->(y, x) { y >= 0 && x >= 0 ? matrix.dig(y, x).to_s : "" }

    left = safe_dig.call(y, x - 1) + safe_dig.call(y, x - 2) + safe_dig.call(y, x - 3)
    right = safe_dig.call(y, x + 1) + safe_dig.call(y, x + 2) + safe_dig.call(y, x + 3)
    up = safe_dig.call(y - 1, x) + safe_dig.call(y - 2, x) + safe_dig.call(y - 3, x)
    down = safe_dig.call(y + 1, x) + safe_dig.call(y + 2, x) + safe_dig.call(y + 3, x)
    up_left = safe_dig.call(y - 1, x - 1) + safe_dig.call(y - 2, x - 2) + safe_dig.call(y - 3, x - 3)
    up_right = safe_dig.call(y - 1, x + 1) + safe_dig.call(y - 2, x + 2) + safe_dig.call(y - 3, x + 3)
    down_left = safe_dig.call(y + 1, x - 1) + safe_dig.call(y + 2, x - 2) + safe_dig.call(y + 3, x - 3)
    down_right = safe_dig.call(y + 1, x + 1) + safe_dig.call(y + 2, x + 2) + safe_dig.call(y + 3, x + 3)

    [up, down, left, right, up_left, up_right, down_left, down_right].count { _1 == "MAS" }
  end
end
