require 'spec_helper'

describe Post do
  before :each do
  	@post = Post.new(title: 'My post', content: 'this is my post\'s content', author: 'Romina Vargas')
  end

  it "should be valid when new" do
  	@post.should be_valid
  end

  it "should be invalid if no title" do
  	@post.title = ''
  	@post.should_not be_valid
  end
  
  it "should be invalid if no content" do
    @post.content = ''
    @post.should_not be_valid
  end
  
  it "should be invalid if no author" do
    @post.author = ''
    @post.should_not be_valid
  end
end
