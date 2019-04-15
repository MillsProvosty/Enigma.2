require_relative './shiftgenerator'

class Decrypt
  include ShiftGenerator
  attr_reader :key,
              :offset,
              :encryption
  def initialize(key, offset, encryption)
    @key = key
    @offset = offset
    @encryption = encryption
  end


end
