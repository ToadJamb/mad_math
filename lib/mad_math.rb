module MadMath
  class Stats
    def initialize(data)
      @data = data
    end

    def load
      stdev
      self
    end

    def average
      @average ||= sum / count.to_f
    end

    def sum_of_squares_with_max_loop
      @sum_of_squares ||= squares_with_max_loop
    end

    # #reduce with the symbol (non-block form) seems most performant
    def sum
      @sum ||= @data.reduce(:+)
    end

    def count
      @count ||= @data.size
    end

    def sum_of_squares
      @sum_of_squares ||= get_sum_of_squares
    end

    def stdev
      @stdev ||= Math.sqrt(sum_of_squares / (count - 1))
    end

    def stdevp
      @stdevp ||= Math.sqrt(sum_of_squares / count)
    end

    def max
      @max ||= @data.max
    end

    def min
      @min ||= @data.min
    end

    private

    def get_sum_of_squares
      @max = @data.first
      @min = @data.first
      @data.map do |num|
        @max = num if @max < num
        @min = num if @min > num
        (num - average) ** 2
      end.reduce(:+)
    end
  end
end
