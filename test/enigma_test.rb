require_relative './test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/encrypt'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_todays_date
    assert_equal "150419", @enigma.generate_todays_date
  end


  def test_it_can_square_todays_date
    assert_equal "22625875561", @enigma.square_the_date
  end

  def test_it_returns_the_last_four_digits
    assert_equal "5561", @enigma.last_four_digits
  end

  def test_generate_offset_returns_hash
    expected = {:a=>5,
                :b=>5,
                :c=>6,
                :d=>1}
    assert_equal expected, @enigma.generate_offsets
  end


  def test_it_can_generate_a_random_number
    assert_equal String, @enigma.random_number.class
  end

  def test_key_generator_creates_keys
    assert_equal Hash, @enigma.key_generator.class
  end

  def test_create_shifts_returns_new_hash
    assert_equal Hash, @enigma.create_shifts.class
  end


  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", ".", ",", "'"]
    assert_equal expected, @enigma.character_set
  end

  def test_welcome_message
    assert_equal "Welcome to Enigma!",  @enigma.welcome_message
  end

end
