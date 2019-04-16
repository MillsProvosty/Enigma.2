require_relative './shiftgenerator'
require_relative './encrypt'

class Enigma
include ShiftGenerator
  def initialize
    @entered_shift_hash = Hash.new(0)
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

  def encrypt(key, date, message)
    offset = find_offset(date)
    self.enter_shift(key, offset)
    encrypted_message = []
    letter_and_index = chars_and_index(message)
      letter_and_index.each do |char|
          encrypted_message << apply_shift(char)
      end
      encrypted_message.flatten.join
  end

  def find_offset(date)
    squared = (date.to_i * date.to_i).to_s
    squared.slice!(-4..-1)
  end

end
