require 'spec_helper'

feature 'post is deleted' do
  before :each do
    post = Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit root_path
  end
  scenario 'post should not appear on posts list' do
   click_link('Delete')
   expect(page).to have_content('Post was deleted successfully')
  end
end