### Prerequisites:

The setups steps expect following tools installed on the system.

- Github

- Ruby 2.7.1 (if possible, install with [RVM](https://rvm.io/rvm/install) ) 

## Install and Execute

1. Check out the repository
   git clone git@github.com:Chucheen/receipt_printer.git
2. Install the needed gems for specs

```
bundle install
```

4. Execute the program

```
ruby main.rb
```

**Note:** Once the program is being executed introduce the list of products. If you want to print the receipt type `print`

## Specs

The specs on this program only cover the lib classes since the main script would've taken more time to build and needed to finalize within time

To run specs:

```
rspec spec
```