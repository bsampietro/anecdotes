module PostLanguagesHelper
  def post_languages_for_select
    PostLanguage.all.collect {|lan| [lan.description, lan.code] }
  end
  
  
end
