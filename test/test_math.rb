require 'helper'

describe Bezier::Math do
  describe "#combination" do
    it "should return nil either of the inputs is not a non-negative integer" do
      assert_nil Bezier::Math.combination(-1, 10)
      assert_nil Bezier::Math.combination(10, -1)
      assert_nil Bezier::Math.combination(1.5, 2)
      assert_nil Bezier::Math.combination(2, 1.5)
    end

    it "should be nil if r > n" do
      assert_nil Bezier::Math.combination(0, 1)
      assert_nil Bezier::Math.combination(10, 11)
    end

    it "should return the correct value" do
      assert_equal Bezier::Math.combination(5, 2), 10
      assert_equal Bezier::Math.combination(10, 8), 45
      assert_equal Bezier::Math.combination(5, 5), 1
      assert_equal Bezier::Math.combination(0, 0), 1
    end
  end
end
