class Author
  attr_reader :name
  private :name

  def initialize(name)
    @name = name
  end

  def save!
    File.write "_authors/#{slug}.md", to_s
  end

  def slug
    name.downcase.gsub(" ", "-")
  end

  private

  def to_s
    <<~AUTHOR
      ---
      title: "#{name}"
      ---
    AUTHOR
  end
end
