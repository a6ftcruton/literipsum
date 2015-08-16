require 'scraper'
require 'url_parser'

namespace :populate_db do
  task :fetch_texts => :environment do
    start_time = Time.now
    puts "\n\n -- Starting Job at #{start_time.strftime(" %I:%M%p")}"

    scraper = Scraper.new 
    scraper.format_and_save_texts

    puts "\n\n -- Completed Job at #{start_time.strftime(" %I:%M%p")}"
    t = (Time.now - start_time)
    puts "\t Total Write Time == #{Time.at(t).utc.strftime("%H:%M:%S")}"
  end
end
