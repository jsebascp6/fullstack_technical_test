class CountWordFrequencyService

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def call
    mssg = "Lo sentimos, no se detectó ninguna palabra en el texto"

    return false, mssg unless text.present?
    return true, word_count
  end

  private

  def word_count
    text
      .split
      .group_by { |word| word.downcase }
      .transform_values(&:count)
      .sort_by { |_, value| -value }
      .to_h
  end
end
