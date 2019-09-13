# frozen_string_literal: true

class CalculatorController < ApplicationController
  # input a, input b and operation
  INPUT_KEYS = %i[input_a operator input_b].freeze
  OPERATORS = %w[+ - * / %].freeze
  REGEX = '(^[+-]?(?:0|[1-9]\d*)(?:\.(?:\d*[1-9]|0))?)$'


def index
  @result = "0"
end

def new
  if params['input'] == 'C'
    @result = '0'
  elsif params['input'] == '='
    @result = calculate(params['result'])
  else
    @result =
      if params['result'] == '0'
        params['input']
      else
        params['result'] + params['input']
      end
  end
  render :index
end

  private

  def calculate(input_calc)
    arguments = parse_argument(input_calc)
    return arguments if arguments == "Error"
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
    if split_argument.length == 5 &&
       split_argument[0] == '-' &&
       split_argument[3] == '-'
      split_argument = [split_argument[0] + split_argument[1],
                        split_argument[2],
                        split_argument[3] + split_argument[4]]
    end

    if split_argument.length == 4 && split_argument[0] == '-'
      split_argument = [split_argument[0] + split_argument[1],
                        split_argument[2],
                        split_argument[3]]
    end

    if split_argument.length == 4 && split_argument[2] == '-'
      split_argument = [split_argument[0],
                        split_argument[1],
                        split_argument[2] + split_argument[3]]
    end

    if split_argument.length != 3 || !OPERATORS.include?(split_argument[1])
      return 'Error'
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
