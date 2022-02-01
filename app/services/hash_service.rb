class HashService

  def self.convert_hash_to_array_ordered(hash)
    @n_e = 0
    @n_s = 0

    new_array = []
    hash.each { |key, value| @n_e=@n_e+1; print_cycles("each"); new_array << [key, value]}

    new_array.sort_by { |_, value| @n_s=@n_s+1; print_cycles("short_by"); -value.to_i }
  end

  private

  def self.print_cycles(function)
    puts function * 5
    puts (function.eql?("each") ? @n_e : @n_s)
    puts function * 5
  end
end
