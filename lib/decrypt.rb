require_relative './shiftgenerator'

class Decrypt
  include ShiftGenerator
  attr_reader :key,
              :offset,
              :encryption,
              :entered_shift_hash
  def initialize(key, offset, encryption)
    @key = key
    @offset = offset
    @encryption = encryption
    @entered_shift_hash = Hash.new(0)
  end

  def chars_and_index(encryption)
    characters = encryption.chars
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

  def reverse_shift(char_array)
    char = char_array[0]
    if char_array[1] % 4 == 0
      shift_alphabet(char, @entered_shift_hash[:a])
    elsif char_array[1] % 4 == 1
      shift_alphabet(char, @entered_shift_hash[:b])
    elsif char_array[1] % 4 == 2
      shift_alphabet(char, @entered_shift_hash[:c])
    elsif char_array[1] %4 == 3
      shift_alphabet(char, @entered_shift_hash[:d])
    end
  end

  def shift_alphabet(entered_char, shift)
    encrypted_chars = []
    reverse_character_set.each do |char|
      if entered_char == char
        index = reverse_character_set.find_index(char)
          char_index_rot = reverse_character_set.rotate(index)
        new_rotate = char_index_rot.rotate(shift)
       encrypted_chars << new_rotate[0]
      end
    end
    encrypted_chars
  end

  def decrypt(key, offset, encryption)
    self.enter_shift(key, offset)
    decrypted_message = []
    letter_and_index = chars_and_index(encryption)
    letter_and_index.each do |char|
      decrypted_message << reverse_shift(char)
    end
    decrypted_message.flatten.join
  end

  def reverse_character_set
    character_set.reverse
  end
end
