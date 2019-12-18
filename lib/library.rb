class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @book_popularity_log = {}
  end

  def add_author(author)
    @authors << author
    @books << author.books
    add_books_to_log(author.books)
    @books = @books.flatten
  end

  def add_books_to_log(books)
    books.each do |book|
      @book_popularity_log[book] = 0 if @book_popularity_log[book].nil?
    end
  end

  def publication_time_frame_for(author)
    start_year = author.books.min_by { |book| book.publication_year.to_i}
    end_year = author.books.max_by { |book| book.publication_year.to_i}
    {start: start_year.publication_year, end: end_year.publication_year}
  end

  def checkout(book)
    if @books.include?(book)
      @book_popularity_log[book] += 1
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

  def most_popular_book
    number_of_books = @book_popularity_log.values.max
    @book_popularity_log.key(number_of_books)
  end
end
