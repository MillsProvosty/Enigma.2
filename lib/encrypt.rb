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



end
