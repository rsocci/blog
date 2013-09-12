require 'spec_helper'

feature 'navbar' do
  subject { page } 

  before :each do
    visit root_path
  end

  it 'loads on page' do
    should have_selector('div.navbar-inner')
  end

  it 'Home link clicked' do
    click_link('Home')
    should have_content('New Post')
  end

  it 'New link clicked' do
    click_link('New')
    should have_selector('div.new_post')
  end
end