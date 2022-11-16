class ItemList
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def empty?
    @items.empty?
  end

  def print_receipt
    total_sales_tax = 0
    global_total = 0
    @items.each do |item|
      puts item_line(item)

      total_sales_tax = total_sales_tax += item.sales_taxes
      global_total = global_total += item.total
    end

    puts "Sales Taxes: #{sprintf( "%.2f", total_sales_tax.round(2))}"
    puts "Total: #{sprintf( "%.2f", global_total.round(2))}"
  end

  def item_line(item)
    "#{item.quantity.to_i} #{item.name.strip}: #{sprintf( "%.2f", item.total)}"
  end
end