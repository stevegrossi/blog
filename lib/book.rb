require "date"

class Book
  def initialize(title, author_slug)
    @full_title = title
    @author_slug = author_slug
  end

  def to_s
    <<~BOOK
      ---
      title: "#{title}"
      subtitle: "#{subtitle}"
      publisher: ""
      published: ""
      asin: ""
      authors:
        - #{@author_slug}
      started: "#{Date.today.to_s}"
      finished:
      ---
    BOOK
  end

  def save!
    File.write "_books/#{slug}.md", to_s
  end

  private

  def title
    @_title ||= @full_title.split(":").first.strip
  end

  def subtitle
    @_subtitle ||= @full_title.split(":").last.strip
  end

  def slug
    title.downcase.gsub(" ", "-")
  end
end
