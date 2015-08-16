require 'test_helper'
require 'formatter'

class FormatterTest < ActiveSupport::TestCase

  def test_it_replaces_spaces_with_dashes
    formatted = Formatter.clean("three word title")
    assert_equal "three-word-title", formatted
  end

  def test_it_replaces_special_characters_with_dashes
    formatted = Formatter.clean("john's title")
    assert_equal "john-s-title", formatted
  end

  def test_it_downcases_all_words
    formatted = Formatter.clean("The Great Gatsby")
    assert_equal  "the-great-gatsby", formatted
  end

  def test_it_appends_underscore_to_end_of_title
    formatted = Formatter.append_underscore("The Great Gatsby")
    assert_equal  "The Great Gatsby_", formatted
  end

  def test_it_returns_normalized_url
    formatted = Formatter.normalize("Gulliver's Travels")
    assert_equal "gulliver-s-travels_", formatted
  end

  def test_it_returns_normalized_url_from_wild_entry
    formatted = Formatter.normalize("Gulliver's_Travels.")
    assert_equal "gulliver-s-travels_", formatted
  end
end
