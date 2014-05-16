module Bezier
  class Bezier
    # Public: Gets/Sets the control points
    attr_accessor :control_points

    # Public: Construct a new instance of Bezier
    #
    # crit_points - The control points of this Bezier curve. They should be
    #                instances of Point.
    def initialize(*control_points)
      self.control_points = control_points
    end

    # Public: Get the degree of this Bezier curve
    #
    # Returns a number
    def degrees
      control_points.length - 1
    end

    # Public: Get a point on the Bezier curve
    #
    # t - An integer in the interval [0, 1]
    #
    # Returns a Point
    def point_from_t(t)
      return nil if t < 0 || t > 1
      output = Point.new(*Array.new(control_points[0].dimensions) { 0 })
      for i in 0..degrees
        coefficient = Math.combination(degrees, i) * ((1 - t) ** (degrees - i)) * (t ** i)
        output += control_points[i] * coefficient
      end
      output
    end

    # Public: "Plot" the Bezier curve.
    #
    # num_points - The number of points to produce. (Default: 1000)
    #
    # Returns an Array of Points
    def run(num_points = 1000)
      Array.new(num_points) { |i| point_from_t(i * 1.0 / (num_points - 1)) }
    end
  end
end
