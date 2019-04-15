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

  
end
