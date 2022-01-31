class CountWords::ResultsController < ApplicationController

  def show
    @frequencies = HashService.convert_hash_to_array_ordered(params["frequency"])
  end

end
