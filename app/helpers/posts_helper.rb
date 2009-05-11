module PostsHelper
  #def post_languages
  #  [["Who cares?","wc"],["English","en"],["Español","es"]]
  #end
  
  def possible_ordering
    [["Created At","ca"],["In Order","io"], ["Most Voted","mv"], ["Random", "rd"]]
  end
  
  def htmlize_carriage_returns(text)
    text.gsub(/\n/,"<br/>")
  end
  
end
