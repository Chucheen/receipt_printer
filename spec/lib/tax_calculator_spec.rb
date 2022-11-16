require 'spec_helper'
require 'lib/tax_calculator'
require 'lib/item'

RSpec.describe TaxCalculator do

  let(:purchase_1) do
    [
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85'
    ]
  end

  let(:purchase_2) do
    [
      '1 imported box of special chocolates at 10.00',
      '1 imported bottle of special perfume at 47.50',
    ]
  end

  let(:purchase_3) do
    [
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '3 imported boxes of chocolates at 11.25'
    ]
  end

  let(:expected_outcome_1) do
    [ 24.98, 16.49, 0.85]
  end

  let(:expected_outcome_2) do
    [ 10.5, 54.65 ]
  end

  let(:expected_outcome_3) do
    [ 32.19, 20.89, 9.75, 35.55 ]
  end

  describe 'totals' do
    it 'has the expected output for case1/purchase_1' do
      purchase_1.each_with_index do |item_line, index|
        taxer = TaxCalculator.new(Item.new(item_line))
        expect(taxer.total).to eq(expected_outcome_1[index])
      end
    end

    it 'has the expected output for case_2/purchase_2' do
      purchase_2.each_with_index do |item_line, index|
        taxer = TaxCalculator.new(Item.new(item_line))
        expect(taxer.total).to eq(expected_outcome_2[index])
      end
    end

    it 'has the expected output for case_2/purchase_2' do
      purchase_3.each_with_index do |item_line, index|
        taxer = TaxCalculator.new(Item.new(item_line))
        expect(taxer.total).to eq(expected_outcome_3[index])
      end
    end
  end
end