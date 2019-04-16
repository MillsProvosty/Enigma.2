require_relative './shiftgenerator'
require_relative './code_it'
require_relative './decrypt'

class Enigma
include ShiftGenerator
include CodeIt
include Decrypt
  def initialize
    @entered_shift_hash = Hash.new(0)
    @character_set = ("a".."z").to_a << " "
  end



end
