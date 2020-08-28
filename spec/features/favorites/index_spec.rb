require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit my favorites index page' do
    before :each do

      @shelter_1 = Shelter.create!(
        name: 'FurBabies4Ever',
        address: '1664 Poplar St',
        city: 'Denver',
        state: 'CO',
        zip: '80220'
      )
      @pet_1 = Pet.create!(
        name: 'Rufus',
        sex: 'male',
        age: '3',
        image: 'https://www.washingtonpost.com/resizer/uwlkeOwC_3JqSUXeH8ZP81cHx3I=/arc-anglerfish-washpost-prod-washpost/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg',
        shelter_id: @shelter_1.id,
        description: 'The cutest dog in the world. Adopt him now!'
      )
      @pet_2 = Pet.create!(
        name: 'Snuggles',
        sex: 'female',
        age: '5',
        image: 'https://upload.wikimedia.org/wikipedia/commons/6/66/An_up-close_picture_of_a_curious_male_domestic_shorthair_tabby_cat.jpg',
        shelter_id: @shelter_1.id,
        description: 'A lovable orange cat. Adopt her now!'
      )
    end

      it "can see my favorited pets names as links and images" do

        visit "/pets/#{@pet_1.id}"

        click_button 'Add to favorites'

        visit "/pets/#{@pet_2.id}"

        click_button 'Add to favorites'

        visit "/favorites"

        expect(page).to have_link(@pet_1.name)
        expect(page).to have_css("img[src='#{@pet_1.image}']")
        expect(page).to have_link(@pet_2.name)
        expect(page).to have_css("img[src='#{@pet_2.image}']")
      end
    end

end