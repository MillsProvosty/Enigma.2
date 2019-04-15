module Encrypt
  def split_characters(message)
    split_message = message.downcase.split(//)
    split_message
  end

  def validate_characters(message)
    split_message = split_characters(message)
    split_message.all? do |char|
      character_set.include?(char)
    end
  end

  def chars_and_index(message)
    characters = message.downcase.chars
    letter_and_index = characters.map.with_index do |char, index|
      [char, index]
    end
    letter_and_index
  end


  def enter_shift(key, offset)
    entered_shift_hash = {}
    entered_shift_hash[:a] = (key[-5..-4].to_i + offset[0].to_i)
    entered_shift_hash[:b] = (key[-4..-3].to_i + offset[1].to_i)
    entered_shift_hash[:c] = (key[-3..-2].to_i + offset[2].to_i)
    entered_shift_hash[:d] = (key[-2..-1].to_i + offset[3].to_i)
    entered_shift_hash
  end

  def encrypt(key, offset, message)
  split_message = spilt_characters(message)
  split_message.each do |char|
    if !validate_characters(char)
      "Invalid Entry, please only use letters and spaces."
    end
  end
  letter_and_index = chars_and_index(split_message)
  letter_and_index.map do |char, index|

end

def apply_shift(char)
  if char[1] % 4 == 0
    apply_shift(char, :a)
  elsif char[1] % 4 == 1
    apply_shift(char, :b)
  elsif char[1] % 4 == 2
    apply_shift(char, :c)
  elsif char[1] %4 == 3
    apply_shift(char, :d)
  end
end


end
