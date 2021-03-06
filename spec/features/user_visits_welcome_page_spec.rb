require 'rails_helper'

describe "user can visit the welcome page" do
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  it "click on search and see nearest fuel stations" do
    visit '/'

    click_on "Find Nearest Station"

    expect(current_path).to eq('/search')

    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Name: ")
    expect(page).to have_content("Address: ")
    expect(page).to have_content("Fuel Type: ")
    expect(page).to have_content("Access Times: ")
    expect(page).to have_content("Distance: 0.1 miles")
    expect(page).to have_content("1 min away")
    expect(page).to have_content("Directions:")
    expect(page).to have_content("Turn left onto Lawrence St")
    expect(page).to have_content("Destination will be on the left")
  end
end
