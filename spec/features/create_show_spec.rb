require 'rails_helper'

RSpec.feature 'Create show', type: :feature do
  scenario 'Creating a show' do
    visit new_show_path
    fill_in 'Name', with: 'The Ruby Testing Podcast'
    fill_in 'XML feed URL', with: 'https://rss.simplecast.com/podcasts/5739/rss'
    click_on 'Create Show'
    expect(page).to have_content('Show was successfully created.')
  end
end
