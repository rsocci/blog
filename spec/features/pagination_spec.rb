require 'spec_helper'

feature 'pagination' do
  before(:each) do
    for i in 0..9
      Post.create(title: 'My post', content: 'The content', author: 'Romina')
    end
    visit root_path
  end

  scenario 'pagination is working' do
    expect(page).to have_no_selector('.pagination')
    Post.create(title: 'My post', content: 'The content', author: 'Romina')
    visit root_path
    expect(page).to have_selector('.pagination')
  end
end