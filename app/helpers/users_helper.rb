module UsersHelper
  def top_voted_users
    User.all(:conditions => "votes > 0", :order => "votes DESC", :limit => TOP_VOTED_USERS_NUMBER)
  end
end
