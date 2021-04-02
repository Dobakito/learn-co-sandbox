class MotorsportNews::News 
  attr_accessor :index, :article
  attr_reader :headline, :url
  @@all = []
  
  def initialize(headline, url)
    @headline = headline
    @url = url
    assign_index
    save
  end 
  
  def assign_index 
    @index = @@all.size + 1
  end 
  
  def save 
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.exist?(input)
    (1..7).include?(input.to_i)
  end 
  
  def self.fetch_news
    MotorsportNews::Scraper.news_scraper if @@all.empty?
  end 
  
  def fetch_article
    MotorsportNews::Scraper.article_scraper(self)
  end
  
  def self.find_by_index(input)
    all.detect{|info| info.index == input.to_i}
  end 
  
  
end 
