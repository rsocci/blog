require 'spec_helper'

feature 'navbar' do
  before :each do
    visit root_path
  end
  
  scenario 'loads on page' do
    expect(page).to have_selector('div.navbar-inner')
  end
  
  scenario 'Home link clicked' do
    click_link('Home')
    expect(page).to have_content('New Post')
  end
  
  scenario 'New link clicked' do
    click_link('New')
    expect(page).to have_selector('div.new_post')
  end
end