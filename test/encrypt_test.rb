require_relative './test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new("38492", "0943", "Hello")
    @encrypt_1 = Encrypt.new("38492", "0943", "Jesus I hope this works")
  end

  def test_encrypt_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_encrypt_has_attributes
    assert_equal "Hello", @encrypt.message
    assert_equal "38492", @encrypt.key
    assert_equal "0943", @encrypt.offset
  end

  def test_split_characters_works_creates_array_of_split_characters

    assert_equal ["m","i","l","l","s"], @encrypt.split_characters("Mills")
  end

  def test_validated_characters_returns_correct_characters
    assert_equal ["m", "i", "l", "l", "s", "!"], @encrypt.validated_characters("Mills!")
    assert_equal ["m", "%", "i", "(", "l", "@", "l", "s", "!"], @encrypt.validated_characters("M%i(l@ls!")
  end

  def test_it_returns_array_of_chars_and_index_numbers
     assert_equal [["m", 0], ["i", 1], ["l", 2], ["l", 3], ["s", 4]], @encrypt.chars_and_index("Mills")
  end


  def test_entered_keys_and_offsets_can_create_shift
    expected = {:a=>38,
                :b=>93,
                :c=>53,
                :d=>95}
    assert_equal expected, @encrypt.enter_shift("38492", "0943")
  end

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
