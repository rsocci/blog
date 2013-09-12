require 'spec_helper'

feature 'comment is added to post' do
  subject { page }

  before :each do
    @post = Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit post_path(@post.id)
  end

  scenario 'user submits comment with valid input' do
   fill_in 'comment_content', with: 'This post is awesome'
   click_button('Submit')
   should have_content('New comment has been added')
  end

  scenario 'user submits comment with invalid input' do
    fill_in 'comment_content', with: ''
    click_button('Submit')
    should have_selector('.field_with_errors')
  end

  scenario 'comments appear in desc order' do
    c1 = Comment.create(content: "this is my comment", post_id: @post.id)
    c2 = Comment.create(content: "Another comment", post_id: @post.id)
    visit post_path(@post.id)
    page.body.index(c2.content).should < page.body.index(c1.content)
  end
end