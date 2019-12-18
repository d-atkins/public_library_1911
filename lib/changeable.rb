module Changeable
  def extract_year(date)
    date[-4..-1]
  end

  def combine_names(first_name, last_name)
    "#{first_name} #{last_name}"
  end
end
