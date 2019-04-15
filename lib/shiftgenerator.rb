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

end
