class ValidateFileAndCountWordsService
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    mssg = "Lo sentimos, el tipo de archivo no es compatible"

    return false, mssg unless file.path.include?(".txt")
    word_frequency
  end

  private

  def word_frequency
    text = file.read

    CountWordFrequencyService.new(text.to_s).()
  end
end
