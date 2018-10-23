require 'rails_helper'

RSpec.feature 'Create show', type: :feature do
  scenario 'Creating a show' do
    visit new_show_path
    fill_in 'Name', with: 'The Honest Abe Show'
    click_on 'Create Show'
    expect(page).to have_content('Show was successfully created.')
  end
end
