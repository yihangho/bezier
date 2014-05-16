require 'helper'

describe Bezier::Bezier do
  before do
    coordinates     = [[20, 20], [20, 100], [200, 100], [200, 20]]
    @control_points = Array.new(4) { |i| Bezier::Point.new *coordinates[i] }
    @bezier         = Bezier::Bezier.new *@control_points
  end

  describe "#control_points" do
    it "should be an Array" do
      assert_instance_of Array, @bezier.control_points
    end

    it "should give the correct control points" do
      assert_equal @bezier.control_points, @control_points
    end
  end

  describe "#degrees" do
    it "should give the correct degrees" do
      assert_equal @bezier.degrees, @control_points.length - 1
    end
  end

  describe "#point_from_t" do
    it "should return P0 when t = 0" do
      assert_equal @bezier.point_from_t(0), @control_points.first
    end

    it "should return PN when t = 1" do
      assert_equal @bezier.point_from_t(1), @control_points.last
    end

    it "should return nil when t is not in [0, 1]" do
      assert_nil @bezier.point_from_t(-1)
      assert_nil @bezier.point_from_t(100)
    end

    it "should return the correct point elsewhere" do
      assert_equal @bezier.point_from_t(0.5), Bezier::Point.new(110, 80)
    end
  end

  describe "#run" do
    it "should return an Array of correct length" do
      assert_instance_of Array, @bezier.run(2)
      assert_equal @bezier.run(2).length, 2
      assert_equal @bezier.run(50).length, 50
    end
  end
end
