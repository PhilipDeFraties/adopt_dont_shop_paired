require 'rails_helper'

RSpec.describe "As a visitor" do
  describe 'when I visit the Shelters Index page' do
    before :each do
      @shelter_1 = Shelter.create!(name: 'FurBabies4Ever', address: '1664 Poplar St', city: 'Denver', state: 'CO', zip: '80220')
      @shelter_2 = Shelter.create!(name: 'PuppyLove', address: '1665 Poplar St', city: 'Fort Collins', state: 'CO', zip: '91442')
    end

    it "I can see all the shelter names" do
      visit '/shelters'

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
    end


    it "when I click a shelter name I go to that shelter's show page" do
      visit '/shelters'

      expect(page).to have_link(@shelter_1.name)
      expect(page).to have_link(@shelter_2.name)

      click_link @shelter_1.name

      expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    end

    it "I can see edit shelter links" do
      visit '/shelters'

      expect(page).to have_link("Edit Shelter", count: 2)
    end

    it "when I click on an edit link I go to that shelters edit page" do
      visit '/shelters'

      click_link('Edit Shelter', match: :first)

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end

    it "I can see delete shelter links" do
      visit '/shelters'

      expect(page).to have_link("Delete Shelter", count: 2)
    end

    it "when I click on a delete shelter link I go to the shelter index page and the deleted shelter is gone" do
      visit '/shelters'

      click_link('Delete Shelter', match: :first)

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(@shelter_1.name)
    end

    it "I can see a 'New Shelter' link" do
      visit '/shelters'

      expect(page).to have_link("New Shelter")
    end

    it "when I click the 'New Shelter' link I am taken to the new shelter form page" do
      visit '/shelters'

      click_link "New Shelter"

      expect(current_path).to eq("/shelters/new")
    end
  end
end
