module ShiftGenerator

  def generate_todays_date
     Time.now.strftime("%d%m%y")
  end

  def square_the_date
    (generate_todays_date.to_i * generate_todays_date.to_i).to_s
  end

  def last_four_digits
    square_the_date.slice!(7..10)
  end

  def generate_offsets
    offset = {}
    offset_num = last_four_digits
    offset[:a] = offset_num[0].to_i
    offset[:b] = offset_num[1].to_i
    offset[:c] = offset_num[2].to_i
    offset[:d] = offset_num[3].to_i
    offset
  end

  def random_number
    new_key = '0000' + rand(0..99999).to_s
  end

  def key_generator
    key_hash = {}
    key = random_number
    key_hash[:a] = key[-5..-4].to_i
    key_hash[:b] = key[-4..-3].to_i
    key_hash[:c] = key[-3..-2].to_i
    key_hash[:d] = key[-2..-1].to_i
    key_hash
  end


  def create_shifts
    shifts_hash = key_generator.merge!(generate_offsets) do |key, keys, offsets|
      keys + offsets
    end
  end

  def character_set
   characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", ".", "," , "'"]
  end

  def split_characters(words)
    split_message = words.downcase.split(//)
    split_message
  end

end
