require 'spec_helper'
require 'lib/item_list'
require 'lib/item'

RSpec.describe ItemList do

  let(:purchase_1) do
    [
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85'
    ]
  end

  let(:purchase_2) do
    [
      '1 imported box of chocolates at 10.00',
      '1 imported bottle of perfume at 47.50',
    ]
  end

  let(:purchase_3) do
    [
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '3 imported box of chocolates at 11.25'
    ]
  end

  let(:expected_outcome_1) do
    <<-EOH
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
    EOH
  end

  let(:expected_outcome_2) do
    <<-EOH
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
    EOH
  end

  let(:expected_outcome_3) do
    <<-EOH
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
    EOH
  end

  describe 'totals' do
    it 'has the expected output for case1/purchase_1' do
      item_list = ItemList.new
      purchase_1.each_with_index do |item_line, index|
        item_list.add(Item.new(item_line))
      end
      expect { item_list.print_receipt }.to output(expected_outcome_1).to_stdout
    end

    it 'has the expected output for case_2/purchase_2' do
      item_list = ItemList.new
      purchase_2.each_with_index do |item_line, index|
        item_list.add(Item.new(item_line))
      end
      expect { item_list.print_receipt }.to output(expected_outcome_2).to_stdout
    end

    it 'has the expected output for case_2/purchase_2' do
      item_list = ItemList.new
      purchase_3.each_with_index do |item_line, index|
        item_list.add(Item.new(item_line))
      end
      expect { item_list.print_receipt }.to output(expected_outcome_3).to_stdout
    end
  end
end