require './lib/shiftgenerator'
require './lib/enigma'
require './lib/code_it'
require './lib/decode'

read_file, write_file, key, date = ARGV

messages = File.open(read_file, "r")
decrypted = File.open(write_file, "w")

decrypt_message = Enigma.new.decrypt(messages.read, key, date)
decrypted.write(decrypt_message[:decryption])
decrypted.close

p "Created #{write_file} with the key #{(decrypt_message[:key])} and date #{(decrypt_message[:date])}"
