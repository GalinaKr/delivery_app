require 'rails_helper'

RSpec.feature "Packages", type: :feature do
  scenario "show home page" do
    courier = create :courier
    visit courier_path(courier)

    expect(page).to have_content "Add new package"
  end

  scenario "add new courier" do
    courier = create :courier
    visit courier_path(courier)

    click_on "New Courier"
    fill_in "Name", with: 'Test Name'
    fill_in "Email", with: 'test@email.com'
    click_on "Save"

    expect(page).to have_content "Test Name"
  end

  scenario "show all packages" do
    courier = create :courier
    package = create :package, courier_id: courier.id

    visit courier_path(courier)

    expect(page).to have_content package.tracking_number
  end
end
