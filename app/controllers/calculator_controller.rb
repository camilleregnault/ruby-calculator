# frozen_string_literal: true

class CalculatorController < ApplicationController
  # input a, input b and operation
  INPUT_KEYS = %i[input_a operator input_b].freeze
  OPERATORS = %w[+ - * / %].freeze
  REGEX = '(^[+-]?(?:0|[1-9]\d*)(?:\.(?:\d*[1-9]|0))?)$'

  def calculate(input_calc)
    arguments = parse_argument(input_calc)
    case arguments[:operator]
    when '+'
      addition(input_a, input_b)
    end
  end

  private

  def parse_argument(argument)
    arguments = {}
    split_argument = argument.split(' ')
    if split_argument.length != 3 ||
       !OPERATORS.include?(split_argument[1])
      raise ArgumentError, 'Arguments to be [Float, operator, Float]'
    end

    split_argument.each_with_index { |arg, index| arguments[INPUT_KEYS[index]] = arg }
    arguments
  end

  def addition(a, b)
    (a.to_f + b.to_f).round(2)
  end

  def subtraction(a, b)
    (a.to_f - b.to_f).round(2)
  end

  def multiplication(a, b)
    a.zero? || b.zero? ? 0 : (a.to_f * b.to_f).round(2)
  end

  def division(a, b)
    a.zero? || b.zero? ? 0 : (a.to_f / b).round(2)
  end

  def modulo(a, b)
    a.zero? || b.zero? ? 0 : a.to_f % b.to_f
  end
end
