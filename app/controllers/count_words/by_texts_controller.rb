class CountWords::ByTextsController < ApplicationController

  def create
    text = sanatize_params[:text]
    status, mssg = CountWordFrequencyService.new(text.to_s).()

    if status
      redirect_to count_words_result_path(:frequency => mssg)
    else
      flash[:error] = mssg
      redirect_to root_path
    end
  end

  private

  def sanatize_params
    params
      .require(:count_words)
      .permit(:text)
  end
end
