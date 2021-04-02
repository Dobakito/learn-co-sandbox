class MotorsportNews::CLI 
  
  def call 
    puts "Welcome to the Formula 1 news app!"
    while @input != "exit"
     display_news
     get_user_input
     article_exist? ? display_article : display_error
     get_next_input
   end 
    display_exit
  end 
  
  def display_news 
    puts "Fetching latest news."
    MotorsportNews::News.fetch_news
    MotorsportNews::News.all.each {|n| puts "#{n.index}. #{n.headline}"}
     puts "\nPlease type the number of the article you would like to read."
  end
  
  def get_user_input
    @input = gets.strip
  end 
  
  def get_next_input
    puts "\nIf you would like to view another article please type 'next' to view the article list, or type 'exit' to leave the app."
    get_user_input
  end 
  
  def article_exist?
    MotorsportNews::News.exist?(@input.to_i)
  end 
    
  def display_article
    news = MotorsportNews::News.find_by_index(@input)
    news.fetch_article
    puts "\n#{news.article}"
  end 
  
  def display_error
    puts "That is not a valid input, please type a correct article id."
  end 
  
  def display_exit
    puts "Thank you for using the CLI Formula 1 News app! come back soon."
  end 
end 