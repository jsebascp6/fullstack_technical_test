class CountWords::ByFilesController < ApplicationController

  def create
    file = File.open(sanatize_params[:file])
    status, mssg = ValidateFileAndCountWordsService.new(file)

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
      .permit(:file)
  end
end
