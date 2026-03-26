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
      assert Shape.member?(Rectangle) # rubocop:disable Minitest/AssertIncludes
      assert Shape.member?(Circle) # rubocop:disable Minitest/AssertIncludes
      refute Shape.member?(Pineapple) # rubocop:disable Minitest/RefuteIncludes
    end

    it "defines other members" do
      assert StringOrInteger.member?(String) # rubocop:disable Minitest/AssertIncludes
      assert StringOrInteger.member?(Integer) # rubocop:disable Minitest/AssertIncludes
      refute StringOrInteger.member?(Float) # rubocop:disable Minitest/RefuteIncludes
      refute StringOrInteger.member?(Pineapple) # rubocop:disable Minitest/RefuteIncludes
    end
  end
end
