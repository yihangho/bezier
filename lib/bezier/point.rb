module Bezier
  # Public: Stuff related to N-dimensional Points
  class Point
    # Public: Gets/Sets coordinates
    attr_accessor :coordinates

    # Public: Construct an instance of Point.
    #
    # *coordinates - N numbers describing an N-dimensional Point.
    #
    # Examples
    #
    #   Bezier::Point.new(1, 2, 3)
    def initialize(*coordinates)
      self.coordinates = coordinates
    end

    # Public: Vector addition.
    #
    # another - Another instance of Point having the same dimension as the
    #           current Point
    #
    # Examples
    #
    #   Bezier::Point.new(1, 2, 3) + Bezier::Point.new(4, 5, 6)
    #   => (5, 7, 9)
    #
    #   Bezier::Point.new(1, 2) + Bezier::Point.new(1, 2, 3)
    #   => nil
    #
    # Returns a new Point if addition can be carried out, nil otherwise
    def +(another)
      if another.respond_to?(:coordinates) && another.coordinates.length == coordinates.length
        new_coordinates = []
        coordinates.each_index do |i|
          new_coordinates << coordinates[i] + another.coordinates[i]
        end
        self.class.new(*new_coordinates)
      else
        nil
      end
    end

    # Public: Equality test
    #
    # another - Another instance of Point to be tested for equality
    #
    # Examples
    #
    #   Bezier::Point.new(1, 2) == Bezier::Point.new(1, 2)
    #   => true
    #
    #   Bezier::Point.new(1, 2) == Bezier::Point.new(1, 2, 3)
    #   => false
    #
    # Returns a Boolean
    def ==(another)
      another.respond_to?(:coordinates) && coordinates == another.coordinates
    end

    # Public: Scalar multiplication
    #
    # scalar - A number (instance of Numeric)
    #
    # Examples
    #
    #   Bezier::Point.new(1, 2) * 2
    #   => (2, 4)
    #
    #   Bezier::Point.new(1, 2) * -1.2
    #   => (-1.2, -2.4)
    #
    # Returns a Point if multiplication can be carried out, nil otherwise
    def *(scalar)
      if scalar.is_a? Numeric
        new_coordinates = coordinates.map { |x| scalar * x }
        self.class.new(*new_coordinates)
      else
        nil
      end
    end
  end
end
