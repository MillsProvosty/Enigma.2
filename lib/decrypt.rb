module Decrypt

  def shift_reversed_alphabet(entered_char, shift)
    encrypted_chars = []
    reversed = @character_set.reverse
    if reversed.include?(entered_char)
      reversed.rotate! until reversed.first == entered_char
      new_aplha = reversed.rotate(shift)
      new_aplha.first
    else
      entered_char
    end
  end

  def apply_decode_shift(char_array)
    char = char_array[0]
    if char_array[1] % 4 == 0 ; shift_reversed_alphabet(char, @entered_shift_hash[:a])
    elsif char_array[1] % 4 == 1 ; shift_reversed_alphabet(char, @entered_shift_hash[:b])
    elsif char_array[1] % 4 == 2 ; shift_reversed_alphabet(char, @entered_shift_hash[:c])
    elsif char_array[1] % 4 == 3 ; shift_reversed_alphabet(char, @entered_shift_hash[:d])
    end
  end

  def decode(message, key, date)
    offset = find_offset(date)
    self.enter_shift(key, offset)
    decrypted_message = []
    letter_and_index = chars_and_index(message)
      letter_and_index.each do |char|
          decrypted_message << apply_decode_shift(char)
      end
      decrypted_message.flatten.join
  end

  def decrypt(encryption, key = self.key_generator, date = self.generate_todays_date)
    {decryption: decode(encryption, key, date),
    key: key,
    date: date}
  end


end
