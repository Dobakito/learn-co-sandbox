require 'nokogiri'
require 'open-uri'


class MotorsportNews::Scraper
  @site = open('https://www.espn.com/f1/')
 

  def self.news_scraper
  doc = Nokogiri::HTML(open(@site)) 
  list = doc.css('ul.headlineStack__list')
  articles = list.children.css('li')
    articles.each do |values| 
      headline = values.text 
      incomplete_url = values.css('a').attribute('href').value
      url = "https://espn.com" + incomplete_url.to_s
      MotorsportNews::News.new(headline, url)
    end 
  end
  
  def self.article_scraper(news)
    doc = Nokogiri::HTML(open(news.url))
    body = doc.css("div.article-body")
    news.article = body.css('p').to_s.gsub('<p>',"").gsub('</p>',"").gsub('<a..>',"").gsub("</a>","")
  end 
end 
 