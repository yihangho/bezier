module Bezier
  # Public: Math-related stuff
  class Math
    # Public: Calculate the number of combinations
    #
    # n - A non-negative Integer, the number of items in a set
    # r - A non-negative Integer, the number of items to be chosen from the set.
    #     r should be at most as large as n
    #
    # Examples
    #
    #   Bezier::Math.combination(10, 8)
    #   => 45
    #
    # Returns an Integer if the combination can be calculated, nil otherwise.
    def self.combination(n, r)
      return nil unless n.is_a?(Integer) && r.is_a?(Integer)
      return nil unless n >= 0 && r >= 0
      return nil if r > n

      output = 1
      for i in 1..r
        output *= (n - i + 1)
        output /= i
      end
      output
    end
  end
end
