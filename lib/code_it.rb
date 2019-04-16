module CodeIt

  def find_offset(date)
    squared = (date.to_i * date.to_i).to_s
    squared.slice!(-4..-1)
  end

  def chars_and_index(message)
    characters = message.downcase.chars
    letter_and_index = characters.map.with_index do |char, index|
      [char, index]
    end
    letter_and_index
  end

  def enter_shift(key, offset)
    @entered_shift_hash[:a] = (key[-5..-4].to_i + offset[0].to_i)
    @entered_shift_hash[:b] = (key[-4..-3].to_i + offset[1].to_i)
    @entered_shift_hash[:c] = (key[-3..-2].to_i + offset[2].to_i)
    @entered_shift_hash[:d] = (key[-2..-1].to_i + offset[3].to_i)
    @entered_shift_hash
  end

  def apply_shift(char_array)
    char = char_array[0]
    if char_array[1] % 4 == 0 ; shift_alphabet(char, @entered_shift_hash[:a])
    elsif char_array[1] % 4 == 1 ; shift_alphabet(char, @entered_shift_hash[:b])
    elsif char_array[1] % 4 == 2 ; shift_alphabet(char, @entered_shift_hash[:c])
    elsif char_array[1] % 4 == 3 ; shift_alphabet(char, @entered_shift_hash[:d])
    end
  end

  def shift_alphabet(entered_char, shift)
    encrypted_chars = []
    @character_set.rotate! until @character_set.first == entered_char
    new_aplha = @character_set.rotate(shift)
    new_aplha.first
  end

  def code(message, key, date)
    offset = find_offset(date)
    self.enter_shift(key, offset)
    encrypted_message = []
    letter_and_index = chars_and_index(message)
      letter_and_index.each do |char|
          encrypted_message << apply_shift(char)
      end
      encrypted_message.flatten.join
  end

  def encrypt(message, key = self.key_generator, date = self.generate_todays_date)
    {encryption: code(message, key, date),
    key: key,
    date: date}
  end
end
