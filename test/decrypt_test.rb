require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/encrypt'
require './lib/decrypt'


class DecryptTest < Minitest::Test
  def setup
    @decrypt = Decrypt.new("38492", "0943", "oecnv")
  end

  def test_decrypt_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_has_attributes
    assert_equal "38492", @decrypt.key
    assert_equal "0943", @decrypt.offset
    assert_equal "oecnv", @decrypt.encryption
  end

  def test_it_can_decrypt_message
    assert_equal "hello", @decrypt.decrypt("38492", "0943", "oecnv")
  end
end
