require_relative "lib/author"
require_relative "lib/book"
require_relative "lib/tag"

namespace :tags do
  #
  # rake tags:new the world
  #
  task :new do
    ARGV.each { |a| task a.to_sym do ; end }
    name = ARGV.drop(1).join(" ")
    Tag.new(name).save!
  end
end

namespace :books do
  #
  # rake books:new Slaughterhouse Five by Kurt Vonnegut
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
