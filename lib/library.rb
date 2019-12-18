class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
      return true
    end
    false
  end
end
