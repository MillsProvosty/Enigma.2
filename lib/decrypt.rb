require './lib/shiftgenerator'
require './lib/enigma'
require './lib/code_it'
require './lib/decode'

ARGV == [read_file, write_file]

messages = File.open(read_file, "r")
encrypted = File.open(write_file, "w")

decrypt_message = Enigma.new.decrypt(encrypt.read)
