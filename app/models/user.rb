class User < ActiveRecord::Base
  
  has_many :posts

  validates_presence_of :nick, :password
  validates_uniqueness_of :nick
  validates_confirmation_of :password
  
  validates_exclusion_of :nick, :in => %w(nick apodo anonimo anonymous admin superuser)
  
  validates_format_of :nick, :with => /\A[A-Za-z0-9_]+\Z/, :allow_blank => true
  validates_format_of :password, :with => /\A[A-Za-z0-9]+\Z/, :allow_blank => true
	validates_length_of :nick, :maximum => MAX_NICK_LETTERS
	validates_length_of :password, :maximum => MAX_PASS_LETTERS
	
	attr_accessible :nick, :password, :password_confirmation
  
  def self.authenticate(nick, password)
    User.find_by_nick_and_password(nick, password)
  end
  
  def before_validation
    self.nick.strip!
    self.nick.downcase!
  end
  
end
