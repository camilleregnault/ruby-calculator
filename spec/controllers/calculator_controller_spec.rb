# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do
  let(:cal) { CalculatorController.new }

  describe '#parse_argument' do
    it 'raises an error if the argument cannot be split into 3 arguments' do
      expect { cal.send(:parse_argument, '1+3') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the first and the last arguments are not numbers' do
      expect { cal.send(:parse_argument, 'a + 3') }.to raise_error(ArgumentError)
      expect { cal.send(:parse_argument, '1 + b') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the middle argument is not an operator' do
      expect { cal.send(:parse_argument, '1 2 3') }.to raise_error(ArgumentError)
    end

    it 'retruns parsed input string' do
      expect(cal.send(:parse_argument, '1 + 3')).to eq(
        input_a: '1',
        operator: '+',
        input_b: '3'
      )
    end

  end
end
