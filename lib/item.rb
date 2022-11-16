require 'lib/tax_calculator'

class Item
  PARSER_REGEX = /(\d+)\s((?:imported)?)(.+)at\s(\d+(?:\.)?(?:\d+)?)/
  attr_reader :quantity, :is_imported, :name, :price, :line_total

  @well_formed_line = false

  def initialize(item_line)
    process(item_line)
  end

  def sales_taxes
    @tax_calculator.sales_taxes
  end

  def total
    @tax_calculator.total
  end

  def valid?
    @well_formed_line
  end

  private

  def process(item_line)
    return unless item_line =~ PARSER_REGEX

    @quantity = $1.to_f
    @is_imported = !$2.empty?
    @name = is_imported ? "imported #{$3.strip}" : $3
    @price = $4.to_f

    @well_formed_line = true
    @tax_calculator = TaxCalculator.new(self)
  end
end
