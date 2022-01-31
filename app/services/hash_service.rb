class HashService

  def self.convert_hash_to_array_ordered(hash)
    new_array = []
    hash.each { |key, value| new_array << [key, value]}

    new_array.sort_by { |_, value| -value.to_i }
  end

end
