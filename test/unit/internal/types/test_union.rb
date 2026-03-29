# frozen_string_literal: true

require "test_helper"

describe Pinnacle::Internal::Types::Union do
  class Rectangle < Pinnacle::Internal::Types::Model
    literal :type, "square"

    field :area, Float
  end

  class Circle < Pinnacle::Internal::Types::Model
    literal :type, "circle"

    field :area, Float
  end

  class Pineapple < Pinnacle::Internal::Types::Model
    literal :type, "pineapple"

    field :area, Float
  end

  module Shape
    extend Pinnacle::Internal::Types::Union

    discriminant :type

    member -> { Rectangle }, key: "rect"
    member -> { Circle }, key: "circle"
  end

  module StringOrInteger
    extend Pinnacle::Internal::Types::Union

    member String
    member Integer
  end

  describe "#coerce" do
    it "coerces hashes into member models with discriminated unions" do
      circle = Shape.coerce({ type: "circle", area: 4.0 })

      assert_instance_of Circle, circle
    end
  end

  describe "#member" do
    it "defines Model members" do
      assert_includes Shape, Rectangle
      assert_includes Shape, Circle
      refute_includes Shape, Pineapple
    end

    it "defines other members" do
      assert_includes StringOrInteger, String
      assert_includes StringOrInteger, Integer
      refute_includes StringOrInteger, Float
      refute_includes StringOrInteger, Pineapple
    end
  end
end
