class CountWords::ResultsController < ApplicationController

  def show
    if params["frequency"].present?
      @frequencies = HashService.convert_hash_to_array_ordered(params["frequency"])
    else
      flash[:error] = "Lo sentimos, primero debes escribir o cargar un texto."
      redirect_to root_path
    end
  end

end
