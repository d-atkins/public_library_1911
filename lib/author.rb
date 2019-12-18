require './lib/book'
require './lib/changeable'

class Author
  include Changeable

  attr_reader :name, :books

  def initialize(author_info)
    @name = combine_names(author_info[:first_name], author_info[:last_name])
    @books = []
  end

  def write(title, publication_date)
    book = Book.new(book_info_hash(title, publication_date))
    @books << book
    book
  end

  def book_info_hash(title, publication_date)
    {
      author_first_name: @name.split[0],
      author_last_name: @name.split[1],
      title: title,
      publication_date: extract_year(publication_date)
    }
  end
end
