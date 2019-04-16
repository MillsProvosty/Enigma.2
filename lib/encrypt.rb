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





def apply_shift(char_array)
  char = char_array[0]
  if char_array[1] % 4 == 0
    shift_alphabet(char, @entered_shift_hash[:a])
  elsif char_array[1] % 4 == 1
    shift_alphabet(char, @entered_shift_hash[:b])
  elsif char_array[1] % 4 == 2
    shift_alphabet(char, @entered_shift_hash[:c])
  elsif char_array[1] % 4 == 3
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
        encrypted_message << apply_shift(char)
    end
    encrypted_message.flatten.join
  end



end
