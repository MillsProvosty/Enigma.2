require_relative './shiftgenerator'
require_relative './encrypt'

class Enigma
include ShiftGenerator
  def initialize
    @entered_shift_hash = Hash.new(0)
  end

  def encrypt(key, date, message)
    find_offset(date)
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
