# frozen_string_literal: true

require "test_helper"

describe Rcs::Internal::Types::Boolean do
  describe ".coerce" do
    it "coerces true/false" do
      assert Rcs::Internal::Types::Boolean.coerce(true)
      refute Rcs::Internal::Types::Boolean.coerce(false)
    end

    it "coerces an Integer" do
      assert Rcs::Internal::Types::Boolean.coerce(1)
      refute Rcs::Internal::Types::Boolean.coerce(0)
    end

    it "coerces a String" do
      assert Rcs::Internal::Types::Boolean.coerce("1")
      assert Rcs::Internal::Types::Boolean.coerce("true")
      refute Rcs::Internal::Types::Boolean.coerce("0")
    end

    it "passes through other values with strictness off" do
      obj = Object.new

      assert_equal obj, Rcs::Internal::Types::Boolean.coerce(obj)
    end

    it "raises an error with other values with strictness on" do
      assert_raises Rcs::Internal::Errors::TypeError do
        Rcs::Internal::Types::Boolean.coerce(Object.new, strict: true)
      end
    end
  end
end
