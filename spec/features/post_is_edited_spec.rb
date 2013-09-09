require 'spec_helper'

feature 'post is edited' do
  before :each do
    @post = Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit post_path(@post.id)
  end
  
  scenario 'user sees edited post' do
    click_button('Edit')
    page.fill_in 'Title', with: 'Welcome'
    click_button('Submit')
    expect(page).to have_content('Welcome')
  end
end