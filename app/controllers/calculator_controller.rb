class CalculatorController < ApplicationController
  def add_numbers
    @result = params[:a].to_i + params[:b].to_i
  end

  def add_numbers_json
    result = params[:a].to_i + params[:b].to_i
    render json: {
        "result" => result
    }
  end
end
