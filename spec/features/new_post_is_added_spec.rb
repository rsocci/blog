require 'spec_helper'

feature 'new post is added' do
  subject { page }

  before :each do
    Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit root_path
  end

  scenario 'new post appears on posts list' do
    should have_content('My post')
  end

  scenario 'user wants to see a specific post' do
    click_link('My post')
    should have_content('My post')
    should have_content('The content')
  end

  scenario 'user creates post with valid input' do
    click_link('New Post')
    fill_in 'Title', with: 'Hello World'
    fill_in 'Content', with: 'Just saying hello'
    fill_in 'Author', with: 'Romina Vargas'
    click_button('Submit')
    should have_content('New post has been added')
    "Hello World".should < "My Post"
  end

  scenario 'use creates post with invalid input' do
    click_link('New Post')
    click_button('Submit')
    should have_selector('.field_with_errors')
  end
end