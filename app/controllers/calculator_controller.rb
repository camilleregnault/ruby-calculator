# frozen_string_literal: true

class CalculatorController < ApplicationController
  # input a, input b and operation
  INPUT_KEYS = %i[input_a operator input_b].freeze
  OPERATORS = %w[+ - * / %].freeze

  def calculator(input_calc)
    input_a = params[:input_a].to_i
    input_b = params[:input_b].to_i
    operation = params[:operation]
    case operation
    when '+'
      addition(input_a, input_b)
    when '-'
      subtraction(input_a, input_b)
    
    end
  end

  private

  def parse_argument(argument)
    arguments = {}
    split_argument = argument.split(' ')
    if split_argument.length != 3 ||
       !split_argument[0].scan(/\D/).empty? ||
       !split_argument[2].scan(/\D/).empty? ||
       !OPERATORS.include?(split_argument[1])
      raise ArgumentError, 'Arguments to be [int, operator, int]'
    end

    split_argument.each_with_index { |arg, index| arguments[INPUT_KEYS[index]] = arg }
    p arguments
  end

  def addition(a, b)
    a + b
  end

  def subtraction(a, b)
    a - b
  end

  def multiplication(a, b)
    a * b
  end

  def division(a, b)
    a / b
  end

  def modulo(a, b)
    a % b
  end
end
