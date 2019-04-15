require_relative './shiftgenerator'
require_relative './encrypt'

class Enigma
include ShiftGenerator
  def initialize

  end

  def welcome_message
    system "clear"
    p "Welcome to Enigma!" sleep(3.0)

  end

  def run_encrypt
    p "Let's encrypt a message!" sleep(2.0)
    p " Enter your message using only letters and spaces. Punctuation will return an error. "
    message = gets.chomp
  
  end

end
