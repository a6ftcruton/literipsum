require 'scraper'
require 'url_parser'

namespace :populate_db do
  task :fetch_texts => :environment do
    scraper = Scraper.new 
    scraper.format_and_save_texts
  end
end
