class PostInfo < ActiveRecord::Base
  set_table_name "posts_info"
  serialize :voters_ips, Array
  
  def vote(remote_ip)
    if !self.voters_ips.include?(remote_ip)
      self.increment(:votes) 
      self.voters_ips << remote_ip
      self.save
    end
  end
  
  def before_create
    self.voters_ips = []
  end
end
