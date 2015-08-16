require 'mechanize'

class Scraper
  attr_accessor :page

  def initialize
    @base_url = 'https://github.com/'
    @page = 'https://github.com/GITenberg'
  end

  def current_page
    @agent = Mechanize.new
    @agent.get(@page)
  end

  def format_and_save_texts
    texts = current_page.parser
                        .css('.repo-list-name > a')
                        .text.split(/\n/).reject(&:empty?)
    
    parse_structs(texts)
    unless final_page?
      puts "scraping page #{@page.slice(/\d*$/)}"
      repeat_for_next_page
    else
      puts "reached final page"
    end
  end

  private

  def parse_structs(texts)
     texts.each do |t|
       t = UrlParser.parse(t)
       puts "finding/creating...#{t.title}"
       Text.find_or_create_by(title: t.title, book_id: t.book_id)
     end
  end

  def repeat_for_next_page
    next_page = current_page.link_with(:dom_class => 'next_page')
    @page = @base_url + next_page.uri.to_s
    next_page.click
    format_and_save_texts
  end

  def final_page?
    !current_page.parser.css('.next_page.disabled').empty?
  end
end

