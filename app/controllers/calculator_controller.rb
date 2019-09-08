# frozen_string_literal: true

class CalculatorController < ApplicationController
  # input a, input b and operation
  INPUT_KEYS = %i[input_a operator input_b].freeze
  OPERATORS = %w[+ - * / %].freeze
  REGEX = '(^[+-]?(?:0|[1-9]\d*)(?:\.(?:\d*[1-9]|0))?)$'

def index
  @input_calc = params[:input_calc]
end

  private

  def calculate(input_calc)
    arguments = parse_argument(input_calc)
    case arguments[:operator]
    when '+'
      addition(arguments[:input_a], arguments[:input_b])
    when '-'
      subtraction(arguments[:input_a], arguments[:input_b])
    when '*'
      multiplication(arguments[:input_a], arguments[:input_b])
    when '/'
      division(arguments[:input_a].to_f, arguments[:input_b])
    when '%'
      modulo(arguments[:input_a], arguments[:input_b])
    end
  end

  def parse_argument(argument)
    arguments = {}
    split_argument = argument.split(' ')
    if split_argument.length != 3 ||
       !OPERATORS.include?(split_argument[1])
      raise ArgumentError, 'Arguments to be [Float, operator, Float]'
    end

    split_argument.each_with_index do |arg, index|
      arguments[INPUT_KEYS[index]] = arg if index == 1
      arguments[INPUT_KEYS[index]] = arg.to_f if index.zero? || index == 2
    end
    arguments
  end

  def addition(a, b)
    (a + b).round(2)
  end

  def subtraction(a, b)
    (a - b).round(2)
  end

  def multiplication(a, b)
    a.zero? || b.zero? ? 0 : (a * b).round(2)
  end

  def division(a, b)
    a.zero? || b.zero? ? 0 : (a / b).round(2)
  end

  def modulo(a, b)
    a.zero? || b.zero? ? 0 : a % b
  end
end
