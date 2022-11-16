require 'lib/item'

class TaxCalculator
  IMPORTING_TAX = 0.05
  UNIVERSAL_TAX = 0.1
  EXCLUDED_KEYWORDS = %w[pill chocolate food book bread cough capsule \ ache].freeze

  def initialize(item)
    @item = item
    @imported_tax = 0
    @universal_tax = 0
    taxify!
  end

  def sales_taxes
    (@imported_tax + @universal_tax) * @item.quantity
  end

  def total
    ((@item.price * @item.quantity) + sales_taxes).round(2)
  end

  private
  def universal_tax_valid?
    name = @item.name.downcase
    EXCLUDED_KEYWORDS.each do |item_keyword|
      return false if name =~ /#{item_keyword}/
    end

    true
  end

  def taxify!
    @imported_tax = @item.price * IMPORTING_TAX if @item.is_imported
    @universal_tax = @item.price * UNIVERSAL_TAX if universal_tax_valid?

    @imported_tax = round_dec_five(@imported_tax) if @imported_tax.is_a? Float
    @universal_tax = round_dec_five(@universal_tax) if @universal_tax.is_a? Float
  end

  def round_dec_five(num)
     (num * 20).ceil.to_f / 20
  end
end
