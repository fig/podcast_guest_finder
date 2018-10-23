require 'rails_helper'

RSpec.feature 'Create person', type: :feature do
  scenario 'Creating a person' do
    visit new_person_path
    fill_in 'Name', with: 'Abraham Lincoln'
    click_on 'Create Person'
    expect(page).to have_content('Person was successfully created.')
  end
end
