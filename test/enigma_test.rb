require_relative './test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/code_it'
require './lib/decrypt'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_todays_date
    assert_equal "160419", @enigma.generate_todays_date
  end


  def test_it_can_square_todays_date
    assert_equal "25734255561", @enigma.square_the_date
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

  def test_find_offset_makes_offset_for_given_date
    assert_equal "1025", @enigma.find_offset("040895")
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


  def test_split_characters_creates_array

    assert_equal ["m","i","l","l","s"], @enigma.split_characters("Mills")
  end

  def test_it_returns_array_of_chars_and_index_nums
     assert_equal [["m", 0], ["i", 1], ["l", 2], ["l", 3], ["s", 4]], @enigma.chars_and_index("Mills")
  end


  def test_entered_keys_and_offsets_can_create_shift
    expected = {:a=>38,
                :b=>93,
                :c=>53,
                :d=>95}
    assert_equal expected, @enigma.enter_shift("38492", "0943")
  end

  def test_shift_alphabet_shifts_letters
    assert_equal "v", @enigma.shift_alphabet("m", 9)
  end

  def test_it_can_code_the_info
    assert_equal "keder ohulw", @enigma.code("hello world", "02715", "040895")
  end

  def test_it_can_encrypt
    expected = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
   }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected = {
    message: "hello world",
    key: "02715",
    date: "040895"
   }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end







end
