# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
      expect(calculator.add("5")).to eq(5)
    end

    it "returns the sum of comma-separated numbers" do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it "allows new lines between numbers and returns the sum" do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("1\n2\n3\n4\n5")).to eq(15)
    end

    it "supports different delimiters and returns the sum" do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//@\n1@2@3")).to eq(6)
    end

    it "raises an exception for negative numbers and shows all negatives in the message" do
      calculator = StringCalculator.new
      expect { calculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed: -1,-3")
    end
  end
end

