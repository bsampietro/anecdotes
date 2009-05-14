module PostsHelper  
  def possible_ordering
    [[t('created_at'),"ca"],[t('first_created'),"io"], [t('most_voted'),"mv"], [t('random'), "rd"]]
  end
  
  def htmlize_carriage_returns(text)
    text.gsub(/\n/,"<br/>")
  end
  
end
