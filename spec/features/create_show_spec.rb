require 'rails_helper'

RSpec.feature 'Create show', type: :feature do
  before do
    visit new_show_path
    fill_in 'Name', with: 'The Ruby Testing Podcast'
    fill_in 'XML feed URL', with: 'https://rss.simplecast.com/podcasts/5739/rss'
    click_on 'Create Show'
  end

  scenario 'Show creation' do
    expect(page).to have_content('Show was successfully created.')
  end

  scenario 'Episode creation' do
    visit episodes_path
    expect(page).to have_content('How Todd Siegel Got Started with Testing')
  end
end
