class Tag
  attr_reader :name
  private :name

  def initialize(name)
    @name = name
  end

  def save!
    File.write "_tags/#{slug}.md", to_s
  end

  def slug
    name.downcase.gsub(" ", "-")
  end

  private

  def to_s
    <<~TAG
      ---
      title: "#{name}"
      ---
    TAG
  end
end
