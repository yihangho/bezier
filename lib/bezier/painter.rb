require 'chunky_png'

module Bezier
  # Public: Paint an Array of Points into a PNG file
  class Painter
    # Public: The Array of Points to be drawn.
    attr_accessor :points

    # Public: The path to the output file.
    attr_accessor :path

    # Public: The padding to be added to the edges of the image.
    attr_accessor :padding

    # Public: Contruct a new instance of Bezier::Painter.
    #
    # Examples
    #
    #   painter = Bezier::Painter.new do |p|
    #     p.points  = [...]
    #     p.path    = "Bézier.png"
    #     p.padding = 20
    #   end
    def initialize
      self.points  = []
      self.path    = "Bézier.png"
      self.padding = 10
      yield(self) if block_given?
    end

    # Public: Save the PNG
    #
    # Returns nothing
    def save
      parameters = get_parameters
      image = ChunkyPNG::Image.new(parameters[:width], parameters[:height], ChunkyPNG::Color::WHITE)
      points.each do |pt|
        x = pt.x - parameters[:x_offset]
        y = pt.y - parameters[:y_offset]
        image[x.round, y.round] = ChunkyPNG::Color::BLACK
      end
      p image.class
      image.save(path)
    end

    # Internal: Get the parameters associated with this PNG.
    #
    # Returns a Hash
    def get_parameters
      output = {}

      output[:x_min] = self.points.min_by { |p| p.x }.x
      output[:x_max] = self.points.max_by { |p| p.x }.x
      output[:y_min] = self.points.min_by { |p| p.y  }.y
      output[:y_max] = self.points.max_by { |p| p.y  }.y

      output[:width]  = (output[:x_max] - output[:x_min] + 2 * self.padding).ceil
      output[:height] = (output[:y_max] - output[:y_min] + 2 * self.padding).ceil

      output[:x_offset] = output[:x_min] - self.padding
      output[:y_offset] = output[:y_min] - self.padding

      output
    end
  end
end
