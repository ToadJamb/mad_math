module MadMath
  class NewtonPolynomial
    def initialize(data = [])
      @xs = []
      @ys = []
      @calc = []

      #pp data
      #puts '-' * 80

      data.each do |el|
        raise "Element is missing." if el.length != 2
        add el.first, el.last
      end
    end

    def add(x, y)
      @xs << x
      @ys << y

      calc(x) if @xs.length > 1
    end

    def value_for(x)
      y = @ys.first
      #print "#{@ys.first} + "
      @calc.each_with_index do |col, i|
        #print "#{col[0]}"
        xs = (i + 1).times.to_a.map do |j|
          #print " * (#{x} - #{@xs[j]})"
          x - @xs[j]
        end.reduce(:*)
        y += col[0] * xs
        #print " + "
      end
      #puts
      #puts '=' * 80
      y
    end

    private

    def solve(x2, y2, x1, y1)
      #puts "(#{y2} - #{y1}) / (#{x2} - #{x1})"
      (y2 - y1) / (x2 - x1).to_f
    end

    def calc(lx)
      rows = @xs.count

      @calc << []

      col = 0
      xn = rows - 2

      while @calc[col]
        y2 = (@calc[col - 1] && @calc[col - 1][-1]) || @ys[-1]
        y1 = (@calc[col - 1] && @calc[col - 1][-2]) || @ys[-2]

        @calc[col] << solve(lx, y2, @xs[xn], y1)

        col += 1
        xn -= 1
        #puts '-' * 80
      end
      #pp @calc
      #puts '-' * 80
    end
  end
end
