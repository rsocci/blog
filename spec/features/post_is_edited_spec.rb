require 'spec_helper'

feature 'post is edited' do
  before :each do
    @post = Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit root_path
  end
  
  scenario 'user sees edited post' do
    click_link('Edit')
    page.fill_in 'Title', with: 'Welcome'
    click_button('Submit')
    expect(page).to have_content('Post was updated successfully')
  end

  scenario 'user edits post with invalid input' do
    click_link('Edit')
    page.fill_in 'Title', with: ''
    click_button('Submit')
    expect(page).to have_selector('.field_with_errors')
  end
end