require_relative "lib/author"
require_relative "lib/book"

namespace :books do

  # Searches for a book via the Amazon Product Advertising API,
  # and displays what would be persisted by rake books:find, e.g.
  #
  #     rake books:new Slaughterhouse Five by Kurt Vonnegut
  #
  task :new do
    ARGV.each { |a| task a.to_sym do ; end }
    title_and_author = ARGV.drop(1).join(" ").split(" by ")
    title = title_and_author.first
    author = title_and_author.last

    author = Author.new(author)
    author.save!
    Book.new(title, author.slug).save!
  end
end
