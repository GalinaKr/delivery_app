require 'rails_helper'

RSpec.feature "Couriers", type: :feature do
  scenario "show home page" do
    visit root_path

    expect(page).to have_content "Home"
  end

  scenario "add new courier" do
    visit root_path

    click_on "New Courier"
    fill_in "Name", with: 'Test Name'
    fill_in "Email", with: 'test@email.com'
    click_on "Save"

    expect(page).to have_content "Test Name"
  end

  scenario "show all couriers" do
    courier = create :courier

    visit root_path

    expect(page).to have_content courier.name
  end
end
