require 'helper'

describe Bezier::Point do
  before do
    @point = Bezier::Point.new(1, 2)
  end

  describe "its coordinates" do
    it "should be an Array" do
      assert_kind_of Array, @point.coordinates, "Coordinates should be an Array"
    end

    it "should match what is given" do
      assert_equal @point.coordinates, [1, 2]
    end
  end

  describe "equality" do
    it "should return true if the coordinates are exactly equal" do
      assert_equal @point, Bezier::Point.new(1, 2)
    end

    it "should return false if the other party does not respond to :coordinates" do
      refute_equal @point, 1
    end

    it "should return false if the other party does not have the same coordinates" do
      refute_equal @point, Bezier::Point.new(2, 1)
    end

    it "should return false if the other party does not have the same dimenstion" do
      refute_equal @point, Bezier::Point.new(1, 2, 3)
    end
  end

  describe "addition" do
    it "should return nil if the other party does not respond to :coordinates" do
      assert_nil (@point + 1)
    end

    it "should return nil if the other party is not of the same dimension" do
      assert_nil (@point + Bezier::Point.new(1))
      assert_nil (@point + Bezier::Point.new(1, 2, 3))
    end

    it "should perform correct addition" do
      assert_equal (@point + Bezier::Point.new(1, 2)), Bezier::Point.new(2, 4)
    end
  end

  describe "scalar multiplication" do
    it "should return nil if parameter given is not a number" do
      assert_nil (@point * "Hello")
    end

    it "should perform correct multiplicaiton" do
      assert_equal (@point * 2), Bezier::Point.new(2, 4)
      assert_equal (@point * -1.2), Bezier::Point.new(-1.2, -2.4)
    end
  end
end
