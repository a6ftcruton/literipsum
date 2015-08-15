require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/literipsum'

class LiteripsumTest < Minitest::Test
  # book = "Tom Sawyer"
  # my_ipsum = Literipsum.new(book)
  #
  # my_ipsum.header_words(3)
  # my_ipsum.sentences(3)
  # my_ipsum.paragraphs(3)

  def test_it_is_initialized_with_a_single_string
    ipsum = Literipsum.new("Tom Sawyer") 
    assert_equal ipsum.book, "Tom Sawyer" 
  end

  def test_it_raises_argument_error_when_initialized_with_no_args
    assert_raises(ArgumentError) { Literipsum.new }
  end

  def test_it_raises_argument_error_when_initialized_with_more_than_one_arg
    assert_raises(ArgumentError) { Literipsum.new.("firsbook", "secondbook") }
  end

end
