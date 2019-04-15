require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/shiftgenerator'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_todays_date
    assert_equal "130419", @enigma.generate_todays_date
  end

end
