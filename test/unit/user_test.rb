require 'test_helper'

class UserTest < ActiveSupport::TestCase  
  context "A user" do
    setup do
      @user = User.create!(:nick => "jimmy", :password => "pass", :votes => 5)
    end
    subject { @user }
    
    should_have_many :posts
    
    should_validate_presence_of :nick, :password    
    should_validate_uniqueness_of :nick
    should_not_allow_values_for :nick, "nick", "apodo", "anonimo", "anonymous", "admin", "superuser", :message => "is reserved"
    should_ensure_length_in_range :nick, 0..MAX_NICK_LETTERS    
    should_ensure_length_in_range :password, 0..MAX_PASS_LETTERS    
    should_allow_mass_assignment_of :nick, :password 
    should_not_allow_mass_assignment_of :votes
    
    should "authenticate with a correct username and password" do
      assert User.authenticate("jimmy", "pass")
    end
    
    should "not authenticate with a non correct password" do
      assert !User.authenticate("jimmy", "incorrect")
    end    
  end
end
