class PostLanguage

  attr_reader :code, :description

  def initialize(code, description)
    @code = code
    @description = description
  end
  
  def self.all
    [PostLanguage.new("wc", "Who Cares?"), PostLanguage.new("en", "English"), PostLanguage.new("es", "Español")]
  end

end
