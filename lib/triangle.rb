# frozen_string_literal: true

class Triangle
  # write code here

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    raise TriangleError if side1.nil? || side2.nil? || side3.nil?

    raise TriangleError if side1 <= 0 || side2 <= 0 || side3 <= 0

    if (side1 + side2) <= side3 || (side1 + side3) <= side2 || (side2 + side3) <= side1
      raise TriangleError
    end

    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral

    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles

    else
      :scalene

    end
  end

  class TriangleError < StandardError
    def message
      'A triangle cannot have sides that have a negative length'
    end
  end
end
