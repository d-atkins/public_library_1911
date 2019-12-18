require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(author_info)
    @name = "#{author_info[:first_name]} #{author_info[:last_name]}"
    @books = []
  end

  def write(title, publication_date)
    book_info = {
      author_first_name: @name.split[0],
      author_last_name: @name.split[1],
      title: title,
      publication_date: publication_date[-4..-1]
      }
    Book.new(book_info)
  end
end
