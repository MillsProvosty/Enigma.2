require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
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
    assert_equal 9, @enigma.random_number.length
  end

  def test_key_generator_creates_keys
    skip
    expected = {:a=>18,
                :b=>83,
                :c=>35,
                :d=>58}
    assert_equal expected, @enigma.key_generator
  end

  def test_create_shifts_returns_new_hash
    skip
    expected = {:a=>50,
                :b=>55,
                :c=>11,
                :d=>53}
    assert_equal expected, @enigma.create_shifts
  end


  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                " "]
    assert_equal expected, @enigma.character_set
  end

  def test_split_characters_works_creates_array_of_split_characters
    assert_equal ["m","i","l","l","s"], @enigma.split_characters("Mills")
  end

  def test_validate_characters_returns_true_or_false
    assert_equal true, @enigma.validate_characters("Mills")
    assert_equal false, @enigma.validate_characters("Mills!")
  end

  def test_it_returns_array_of_chars_and_index_numbers
     skip
     assert_equal [["m", 0], ["i", 1], ["l", 2], ["l", 3], ["s", 4]], @enigma.chars_and_index("Mills")
  end


  def test_entered_keys_and_offsets_can_create_shift
    skip
    expected = {:a=>38, :b=>93, :c=>53, :d=>95}
    assert_equal expected, @enigma.enter_shift("38492", "0943")
  end


  def test_it_can_rotate_the_characters
    assert_equal "swqty", @enigma.encrypt("05931","1025", "Mills")
  end


end
