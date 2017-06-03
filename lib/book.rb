require "bookcrawler"
require_relative "author"

ENV["AMAZON_ASSOCIATES_TRACKING_ID"] = "stevgros-20"

class Book
  NotFound = Class.new(StandardError)

  attr_reader :record
  private :record

  def initialize(title)
    client = Bookcrawler::Client.new
    @record = client.find_by_title(title)
    raise NotFound unless @record
  end

  def to_s
    <<~BOOK
      ---
      title: "#{title}"
      slug: #{slug}
      subtitle: "#{subtitle}"
      publisher:
      published:
      asin: "#{record.asin}"
      authors:
        - #{author.slug}
      started: "#{Date.today.to_s}"
      start_year: "#{Date.today.year}"
      finished:
      ---
    BOOK
  end

  def save!
    save_author! && save_book!
  end

  private

  def title
    @_title ||= record.title.split(":").first.strip
  end

  def subtitle
    @_subtitle ||= record.title.split(":").last.strip
  end

  def author
    @_author ||= Author.new(record.author)
  end

  def save_author!
    author.save!
  end

  def save_book!
    File.write "_books/#{slug}.md", to_s
  end

  def slug
    title.downcase.gsub(" ", "-")
  end
end
