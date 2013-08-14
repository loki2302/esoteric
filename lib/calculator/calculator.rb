require 'json'
require 'calculator/adder'

class Calculator
    def initialize(adder = Adder.new)
      @adder = adder
    end

    def add(a, b)
	a + b
    end

    def add_json(a, b)
	JSON({'result' => add(a, b)})
    end
end