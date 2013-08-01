require "json"

class Calculator
    def add(a, b)
	a + b
    end

    def add_json(a, b)
	JSON({"result" => add(a, b)})
    end
end