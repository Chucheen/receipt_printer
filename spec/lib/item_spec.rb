require 'spec_helper'
require 'lib/item'

RSpec.describe Item do

  let(:good_lines) do
    [
      '1 imported box of chocolates at 10.00',
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85',
      '1 imported box of chocolates at 10.00',
      '1 imported bottle of perfume at 47.50',
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '3 imported boxes of chocolates at 11.25'
    ]
  end

  let(:bad_lines) do
    [
      'box of chocolates at 10.00',
      'addsadas',
      '1 imported box of at'
    ]
  end

  describe 'with good lines' do
    it 'recognizes all the item parts' do
      good_lines.each do |item_line|
        item = described_class.new(item_line)
        expect(item.valid?).to be_truthy
        expect(item.is_imported).not_to be_nil
        expect(item.price).not_to be_nil
        expect(item.quantity).not_to be_nil
        expect(item.name).not_to be_nil
      end
    end
  end

  describe 'with bad lines' do
    it 'recognizes all the item parts' do
      bad_lines.each do |item_line|
        item = described_class.new(item_line)
        expect(item.valid?).to be_falsey
        expect(item.is_imported).to be_nil
        expect(item.price).to be_nil
        expect(item.quantity).to be_nil
        expect(item.name).to be_nil
      end
    end
  end
end