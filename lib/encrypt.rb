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


end
