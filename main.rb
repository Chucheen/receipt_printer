libdir = File.dirname('./lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'lib/item_list'
require 'lib/item'
require 'byebug'

prompt = '> '
puts 'Please enter the purchase items'

list = ItemList.new
print prompt
while user_input = gets.chomp # loop while getting user input

  case user_input
  when 'print'
    puts 'At least one item must have been provided' and next if list.empty?
    
    list.print_receipt
    exit(0)
  else
    item = Item.new(user_input)
    unless item.valid?
      puts 'The line description is wrong please try again'
      print prompt # print the prompt, so the user knows to re-enter input
      next
    end

    print prompt
    list.add(item)
  end
end