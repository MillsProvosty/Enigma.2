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
