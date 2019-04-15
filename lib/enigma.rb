require_relative './shiftgenerator'
require_relative './encrypt'

class Enigma
include ShiftGenerator
include Encrypt
  def initialize

  end
end
