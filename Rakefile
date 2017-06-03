require_relative "lib/book"

namespace :books do

  # Searches for a book via the Amazon Product Advertising API,
  # and displays what would be persisted by rake books:find, e.g.
  #
  #     rake books:find Alice in Wonderland
  #
  task :find do
    begin
      ARGV.each { |a| task a.to_sym do ; end }
      title = ARGV[1]
      book = Book.new(title)
      puts book.to_s

    rescue Book::NotFound
      puts "Cannot find book"
    end
  end

  # Searches for a book via the Amazon Product Advertising API,
  # and persists it and its author. e.g.
  #
  #     rake books:new Alice in Wonderland
  #
  task :new do
    begin
      ARGV.each { |a| task a.to_sym do ; end }
      title = ARGV[1]
      book = Book.new(title)
      puts book.to_s
      book.save!

    rescue Book::NotFound
      puts "Cannot find book"
    end
  end
end
