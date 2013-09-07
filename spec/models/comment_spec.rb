require 'spec_helper'

describe Comment do
  before :each do
    @post = Post.new(title: 'post one', content: 'the content', author: 'Romina', id: '1')
    @comment = Comment.new(content: "My comment!", post_id: @post.id)
  end
  
  it "should be valid when new" do
    @comment.should be_valid
  end
  
  it "should not be valid if no content" do
    @comment.content = ''
    @comment.should_not be_valid
  end
  
  it "should not be valid if post_id is missing" do
    @post.id = nil
    @comment.post_id = @post.id
    @comment.should_not be_valid
  end
end
