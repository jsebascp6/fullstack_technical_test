class CountWords::ByTextsController < ApplicationController

  def create
    text = sanatize_params[:text]
    status, mssg = CountWordFrequencyService.new(text).()

    if status
      puts "*"*100
      puts "todo ok"
      puts "*"*100
    else
      flash[:error] = t('.error')
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
