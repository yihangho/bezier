require 'helper'

describe Bezier::Painter do
  before do
    coordinates = [[20, 20], [20, 100], [200, 100], [200, 20]]
    @points     = Array.new(4) { |i| Bezier::Point.new *coordinates[i] }
    @painter    = Bezier::Painter.new { |p| p.points = @points }
  end

  describe "#get_parameters" do
    it "should be a Hash" do
      assert_instance_of Hash, @painter.get_parameters
    end

    it "should contain correct width and height" do
      assert_equal @painter.get_parameters[:width], 200
      assert_equal @painter.get_parameters[:height], 100
    end

    it "should contain correct min, max values" do
      assert_equal @painter.get_parameters[:x_min], 20
      assert_equal @painter.get_parameters[:x_max], 200
      assert_equal @painter.get_parameters[:y_min], 20
      assert_equal @painter.get_parameters[:y_max], 100
    end

    it "should contain correct offsets" do
      assert_equal @painter.get_parameters[:x_offset], 10
      assert_equal @painter.get_parameters[:y_offset], 10
    end
  end
end
