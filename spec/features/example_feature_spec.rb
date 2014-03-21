require 'spec_helper'

feature "User views the index page" do
  scenario "user sees the correct title" do
    visit '/'

    expect(page).to have_content "Hello World"
  end
end
