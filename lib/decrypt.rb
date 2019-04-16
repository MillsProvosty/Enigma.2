module Decrypt

  def shift_reversed_alphabet(entered_char, shift)
    encrypted_chars = []
    reversed = @character_set.reverse
    reversed.rotate! until reversed.first == entered_char
    new_aplha = reversed.rotate(shift)
    new_aplha.first
  end

  def apply_decode_shift(char_array)
    #binding.pry
    char = char_array[0]
    if char_array[1] % 4 == 0 ; shift_reversed_alphabet(char, @entered_shift_hash[:a])
    elsif char_array[1] % 4 == 1 ; shift_reversed_alphabet(char, @entered_shift_hash[:b])
    elsif char_array[1] % 4 == 2 ; shift_reversed_alphabet(char, @entered_shift_hash[:c])
    elsif char_array[1] % 4 == 3 ; shift_reversed_alphabet(char, @entered_shift_hash[:d])
    end
    #binding.pry
  end

  def decode(message, key, date)
    #binding.pry
    offset = find_offset(date)
    self.enter_shift(key, offset)
    decrypted_message = []
    letter_and_index = chars_and_index(message)
      letter_and_index.each do |char|
          decrypted_message << apply_decode_shift(char)
      end
      decrypted_message.flatten.join
      #binding.pry
  end

  def decrypt(encryption, key = self.key_generator, date = self.generate_todays_date)
    #binding.pry
    {message: decode(encryption, key, date),
    key: key,
    date: date}
  end


end
