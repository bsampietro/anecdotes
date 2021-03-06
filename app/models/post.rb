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
          order = "#{self.column_names.rand}"
        when "io"
          order = "created_at"
      end
    end    
    
    if params[:post_language] =~ /\A\w{2}\Z/ && params[:post_language] != "wc"
      conditions << " language_code = '#{params[:post_language]}' AND"
    end
    
    if params[:tag] =~ /\A\d{1,2}\Z/ && params[:tag] != ANYTHING_TAG_ID.to_s
      conditions << " tag_id = '#{params[:tag]}' AND"
    end
    
     if params[:title] =~ /\A\w+\Z/ 
      conditions << " title like '%#{params[:title]}%' AND"
    end
    
    conditions.chomp!("AND"); conditions.strip!
    {:order => order, :conditions => conditions}
  end
  
  protected
  
  def validate    
    self.errors.add(:tag_id) if !self.tag
  end
  
  def before_validation
    self.title.strip! if self.title
    self.title.capitalize if self.title
		self.text.strip! if self.text
		self.text.capitalize! if self.text
  end
  
  def before_save
    self.title = I18n.translate('no_title') if self.title.blank?
  end
  
  def after_save
    self.create_info
    self.tag.increment!(:number_of_stories)
  end
  
  def after_destroy
    self.tag.decrement!(:number_of_stories)
    self.user.decrement!(:votes, self.info.votes)
  end
  
end
