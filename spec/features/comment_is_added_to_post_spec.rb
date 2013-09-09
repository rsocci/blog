require 'spec_helper'

feature 'comment is added to post' do
  before :each do
    @post = Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit post_path(@post.id)
  end
  
  scenario 'user sees comment for the post' do
   fill_in 'comment_content', with: 'This post is awesome'
   click_button('Submit')
   expect(page).to have_content('This post is awesome')
  end
end