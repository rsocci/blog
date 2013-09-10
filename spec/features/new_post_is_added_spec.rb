require 'spec_helper'

feature 'new post is added' do
  before :each do
    Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit root_path
  end
  
  scenario 'new post appears on posts list' do
    expect(page).to have_content('My post')
  end
  
  scenario 'user wants to see a specific post' do
    click_link('My post')
    expect(page).to have_no_selector('table')
    expect(page).to have_content('My post')
    expect(page).to have_content('The content')
  end
  
  scenario 'user wants to create new post' do
    click_button('New Post')
    fill_in 'Title', with: 'Hello World'
    fill_in 'Content', with: 'Just saying hello'
    fill_in 'Author', with: 'Romina Vargas'
    click_button('Submit')
    expect(page).to have_content('New post has been added')
  end
end