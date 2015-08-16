class UrlParser
  
  ParsedText = Struct.new(:title, :book_id)

  def self.parse(url)
    url = url.split("_")
    title = url.first
    if subtitle = title.index("--")
      url = [title[0..(subtitle - 1)], url.last]
    end
    return ParsedText.new(url.first.strip, url.last.to_i)
  end
end
