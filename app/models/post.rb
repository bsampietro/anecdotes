class Post < ActiveRecord::Base

  has_one :info, :class_name => "PostInfo"
  belongs_to :tag
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :text
  
  #validates_length_of :text, :minimum => xx :maximum => xx
  #validates_inclusion_of :tag_id, :in => %w(1 2 3)
  #validates_inclusion_of :language_code, :in => %w(1 2 3)
  
  attr_accessible :title, :text, :tag_id, :language_code
  
  def before_save
    self.title = I18n.translate('no_title') if self.title.blank?
  end
  
  def before_validation
    self.title.strip!; self.title.capitalize!
		self.text.strip!; self.text.capitalize!
  end
  
  def self.generate_conditions(params)
    order = "created_at DESC"        
    conditions = ""
    if params[:order] =~ /\A\w{2}\Z/
      case params[:order]
        when "ca"
          order = "created_at DESC"
        when "mv"
          order = "votes DESC"
        when "rd"
          order = "RAND()"
        when "io"
          order = "created_at"
      end
    end    
    
    if params[:post_language] =~ /\A\w{2}\Z/ && params[:post_language] != "wc"
      conditions = "language_code = '#{params[:post_language]}'"
    end
    
    if params[:tag] =~ /\A\d{1,2}\Z/ && params[:tag] != "1"
      conditions = "tag_id = '#{params[:tag]}'"
    end
    
    {:order => order, :conditions => conditions}
  end

end
