require_relative './test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/encrypt'

class EncryptTest < Minitest::Test







  def test_shift_alphabet_creates_new_alphabet
    assert_equal ["v"], @encrypt.shift_alphabet("m", 9)
  end

  def test_it_can_rotate_the_characters
    assert_equal "sqkzz", @encrypt.encrypt("38492", "0943", "Hello!")
  end

  def test_it_can_encrypt_long_sentence
    assert_equal "sqkzzlvbbxc", @encrypt_1.encrypt("02715", "0943", "Hello world")
  end

end
