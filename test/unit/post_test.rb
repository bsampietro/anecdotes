require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :posts
  #self.use_transactional_fixtures = false
  
  context "A post" do
    
    should_have_one :info
    should_belong_to :tag
    should_belong_to :user
    
    should_validate_presence_of :title, :text
    
    should_allow_values_for :language_code, "wc", "en", "es", "iu"
  end
  
  context "A post made with Factory girl" do 
    setup do 
      @post = Factory.build(:post)  
    end
    
    should "return true" do 
      assert (@post.title == "my title")
    end
  end
  
  context "A post obtained by fixtures" do 
    setup do 
      @post = Post.find(1)
    end
    
    should "be cool" do 
      assert_equal @post.title, "tres post"
    end
  end
end
