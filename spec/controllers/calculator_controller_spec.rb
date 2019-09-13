# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do
  let(:cal) { CalculatorController.new }

  describe '#parse_argument' do
    it 'returns an error if the argument cannot be split into 3 arguments' do
      expect(cal.send(:parse_argument, '1+3-4')).to eq('Error')
    end

    it 'returns an error if the middle argument is not an operator' do
      expect(cal.send(:parse_argument, '1 2 3')).to eq('Error')
    end

    it 'retruns parsed input string' do
      expect(cal.send(:parse_argument, '1 + 3')).to eq(
        input_a: 1.0,
        operator: '+',
        input_b: 3.0
      )
    end
  end

  describe '#operations' do
    it 'returns an addition result' do
      expect(cal.send(:addition, 1.5, 1.6)).to eq(3.1)
      expect(cal.send(:addition, 1.333333, 1.121212)).to eq(2.45)
      expect(cal.send(:addition, -1.0, 3.0)).to eq(2)
      expect(cal.send(:addition, 1.0, 0)).to eq(1)
      expect(cal.send(:addition, -1.0, -30.0)).to eq(-31)
      expect(cal.send(:addition,
                      9_999_999_999.0,
                      9_999_999_999.0)).to eq(19_999_999_998)
    end

    it 'returns a subtraction result' do
      expect(cal.send(:subtraction, 1.5, 3.0)).to eq(-1.5)
      expect(cal.send(:subtraction, -1.0, 3.0)).to eq(-4)
      expect(cal.send(:subtraction, 1.0, 0)).to eq(1)
      expect(cal.send(:subtraction, -1.0, -30.0)).to eq(29)
      expect(cal.send(:subtraction,
                      9_999_999_999.0,
                      -9_999_999_999.0)).to eq(19_999_999_998)
    end

    it 'returns a multiplication result' do
      expect(cal.send(:multiplication, 1.5, 3.0)).to eq(4.5)
      expect(cal.send(:multiplication, -1.0, 3.0)).to eq(-3)
      expect(cal.send(:multiplication, 1.0, 0)).to eq(0)
      expect(cal.send(:multiplication, 1.0, 0.5)).to eq(0.5)
      expect(cal.send(:multiplication, -1.0, -30.0)).to eq(30)
      expect(cal.send(:multiplication,
                      9_999_999_999.0,
                      9_999_999_999.0)).to eq(9.999999998e+19)
    end

    it 'returns a division result' do
      expect(cal.send(:division, 1.0, 3.0)).to eq(0.33)
      expect(cal.send(:division, -1.0, 3.0)).to eq(-0.33)
      expect(cal.send(:division, 1.0, 0)).to eq(0)
      expect(cal.send(:division, 1.0, 0.5)).to eq(2)
      expect(cal.send(:division, -1.0, -30.0)).to eq(0.03)
      expect(cal.send(:division,
                      9_999_999_999.0,
                      9_999_999_999.0)).to eq(1)
    end

    it 'returns a modulo result' do
      expect(cal.send(:modulo, 1.0, 3.0)).to eq(1)
      expect(cal.send(:modulo, -1.0, 3.0)).to eq(2)
      expect(cal.send(:modulo, 1.0, 0)).to eq(0)
      expect(cal.send(:modulo, 1.0, 0.5)).to eq(0)
      expect(cal.send(:modulo, -1.0, -30.0)).to eq(-1)
      expect(cal.send(:modulo,
                      9_999_999_999.0,
                      9_999_999_999.0)).to eq(0)
    end
  end

  describe '#calculate' do
    it 'returns a result for a given argument' do
      expect(cal.send(:calculate, '1 + 50.5')).to eq(51.5)
      expect(cal.send(:calculate, '10 - 50.5')).to eq(-40.5)
      expect(cal.send(:calculate, '10 * 0.5')).to eq(5)
      expect(cal.send(:calculate, '100 / 50.5')).to eq(1.98)
      expect(cal.send(:calculate, '5 % 50')).to eq(5)
    end
  end
end
