require_relative './shiftgenerator'
require_relative './encrypt'

class Enigma
include ShiftGenerator
  def initialize

  end

  def welcome_message
    system "clear"
    p "Welcome to Enigma!"
  end

end
