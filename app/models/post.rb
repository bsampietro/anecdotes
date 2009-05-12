class Post < ActiveRecord::Base

  has_one :info, :class_name => "PostInfo"
  belongs_to :tag
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :text
  
  #validates_length_of :title, :minimum => MIN_POST_TITLE_LETTERS, :maximum => MAX_POST_TITLE_LETTERS
  #validates_length_of :text, :minimum => MIN_POST_TEXT_LETTERS :maximum => MAX_POST_TEXT_LETTERS
  validates_inclusion_of :language_code, :in => %w(wc en es)
  
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
  
  protected
  
  def validate    
    self.errors.add(:tag_id) if !self.tag
  end

end
