require './lib/changeable'

class Book
  include Changeable

  attr_reader :title, :author, :publication_year

  def initialize(book_info)
    @title = book_info[:title]
    @author = "#{book_info[:author_first_name]} #{book_info[:author_last_name]}"
    @publication_year = extract_year(book_info[:publication_date])
  end
end
