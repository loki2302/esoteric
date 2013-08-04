class CalculatorController < ApplicationController
  def add_numbers
    @result = params[:a].to_i + params[:b].to_i

    respond_to do |format|
      format.html
      format.json { render :json => {:result => @result} }
    end
  end

  def add_numbers_json
    result = params[:a].to_i + params[:b].to_i
    render json: {
        "result" => result
    }
  end
end
