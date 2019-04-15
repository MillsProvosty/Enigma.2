require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/shiftgenerator'
require './lib/enigma'
require './lib/encrypt'
require './lib/decrypt'


class DecryptTest < Minitest::Test
  def setup
    decrypt = Decrypt.new()
  end
end
