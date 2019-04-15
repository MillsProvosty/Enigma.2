require_relative './shiftgenerator'

class Encrypt
  include ShiftGenerator
  attr_reader :key,
              :offset,
              :message,
              :entered_shift_hash
  def initialize(key, offset, message)
    @key = key
    @offset = offset
    @message = message
    @entered_shift_hash = Hash.new(0)
  end

  def validate_characters(message)
    split_message = split_characters(message)
    split_message.all? do |char|
      character_set.include?(char)
    end
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
  character_set.each do |char|
    if entered_char == char
      index = character_set.find_index(char)
        char_index_rot = character_set.rotate(index)
      new_rotate = char_index_rot.rotate(shift)
     encrypted_chars << new_rotate[0]
    end
  end
  encrypted_chars
end

def encrypt(key, offset, message)
  self.enter_shift(key, offset)
  encrypted_message = []
  letter_and_index = chars_and_index(message)
    letter_and_index.each do |char|
      if !validate_characters(char[0])
        p  "Invalid Entry, please try again."
        break
      else
          encrypted_message << apply_shift(char)
      end
    end
    encrypted_message.flatten.join
  end

end
