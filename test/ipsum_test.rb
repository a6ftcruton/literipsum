require 'test_helper'
require 'ipsum'

class IpsumTest < ActiveSupport::TestCase  
  # book = "Tom Sawyer"
  # my_ipsum = Ipsum.new(book)
  #
  # my_ipsum.header_words(3)
  # my_ipsum.sentences(3)
  # my_ipsum.paragraphs(3)

  # First step  -> a gem that creates a yaml file (in the root dir) of the book being used
  #   -fork repo
  #   -create "db" (hash with (k,v) = title, identifier)
  #   -use this hash in formatter to create full url
  #     usage : my_ipsum = Ipsum.new("some title") => in the def book method, use Formater.normalize(input)
  #
  # Next step 
  #    -scraping 
  #    -error handling...what if the book isn't in the ProjGutenberg
  def test_it_is_initialized_with_a_single_string
    ipsum = Ipsum.new("Tom Sawyer") 
    assert_equal ipsum.book, "Tom Sawyer" 
  end

  def test_it_raises_argument_error_when_initialized_with_no_args
    assert_raises(ArgumentError) { Ipsum.new }
  end

  def test_it_raises_argument_error_when_initialized_with_more_than_one_arg
    assert_raises(ArgumentError) { Ipsum.new.("firsbook", "secondbook") }
  end

end
