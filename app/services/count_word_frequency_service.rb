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
    @n_g = 0
    @n_t = 0
    text
      .gsub(/[^0-9A-Za-z]/, ' ')
      .split
      .group_by { |word| @n_g=@n_g+1; print_cycles("group_by"); word.downcase }
      .transform_values { |value| @n_t=@n_t+1; print_cycles("transform_values"); value.count }
  end

  def print_cycles(function)
    puts function * 5
    puts (function.eql?("group_by") ? @n_g : @n_t)
    puts function * 5
  end
end
