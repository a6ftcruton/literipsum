require 'test_helper'
require 'url_parser'

class UrlParserTest < ActiveSupport::TestCase  

  def test_it_splits_titles_on_underscore
    url = "The-Man-in-the-Iron-Mask_123"
    assert_equal ["The-Man-in-the-Iron-Mask", "123"], UrlParser.parse(url)
  end

  def test_it_removes_subtitle
    url = "Winesburg-Ohio--A-Group-of-Tales-of-Ohio-Small-Town-Life_416"
    assert_equal ["Winesburg-Ohio", "416"], UrlParser.parse(url)
  end
end
