class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame_for(author)
    start_year = author.books.min_by { |book| book.publication_year.to_i}
    end_year = author.books.max_by { |book| book.publication_year.to_i}
    {start: start_year.publication_year, end: end_year.publication_year}
  end

  def checkout(book)
    if @books.include?(book)
      @checked_out_books << book
      @books.delete_at(@books.index(book))
      return true
    end
    false
  end

  def return(book)
    if book
      @books << book
      @checked_out_books.delete_at(@checked_out_books.index(book))
    end
  end
end
