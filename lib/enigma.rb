require_relative './shiftgenerator'
require_relative './code_it'

class Enigma
include ShiftGenerator
include CodeIt
  def initialize
    @entered_shift_hash = Hash.new(0)
    @character_set = ("a".."z").to_a << " "
  end



end
