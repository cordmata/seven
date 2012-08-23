require 'test/unit'

class HungMatrix

  def initialize(rows)
    # I accept an array of arrays. Each array must be 'square', that is,
    # have the same number of numeric elements. E.g.:
    #
    # [[1,2,3],[4,5,6]]
    @rows = rows
  end

  # Solve for the given matrix and return a mapping of assignments
  # in the form of agent-index => task-index. E.g given matrix:
  #
  # [
  #   [9,1,9]
  #   [1,9,9]
  #   [9,9,1]
  # ]
  #
  # return:
  #
  # { 1 => 2, 2 => 1, 3 => 3 }
  def assign
    zeroed = self.zero self
    row_num = 0
    self.row_vectors.each do |row|
      row_a = row.to_a
      row.contains? 0
      row_num += 1
    end
  end


  def zero
    # zero out the rows
    new = @rows.collect do |v|
      min = v.min
      v.collect {|i| i - min }
    end
    col, row = 0, 0
    new = new.collect do |v|
      (0 .. v.length).each do

      end
      min = cola.min
      next if min == 0
      cola.each do |i|
        row += 1
      end
      col += 1
    end
  end

end

class TestHungarian < Test::Unit::TestCase

  # Assume a simple matrix with obvious solution
  #
  #       push  pull  lift
  #       ----------------
  # bill | 2     5     8
  # jane | 8     3     6
  # jack | 5     6     4
  #
  # Should be solved in first pass resulting in:
  #
  # bill  => push
  # jane  => pull
  # jack  => lift
  def test_simple
    bill = [2,5,8]
    jane = [8,3,6]
    jack = [5,6,4]
    matrix = Matrix.new [bill,jane,jack]
    result = matrix.assign
    assert_true result, { 0 => 0, 1 => 1, 2 => 2 }
  end

end
