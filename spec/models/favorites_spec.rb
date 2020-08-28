require 'rails_helper'

describe Favorites do
  describe '#total_count' do
    it 'can calculate the total number of favorited pets it holds' do
      favorites = Favorites.new({
        '1' => 1,
        '2' => 1
      })

      expect(favorites.total_count).to eq(2)
    end

    describe "#add_pet" do
      it "adds a pet to its contents" do
        favorites = Favorites.new({
          '1' => 1,
          '2' => 1
        })
        favorites.add_pet(1)
        favorites.add_pet(2)

        expect(favorites.total_count).to eq(4)
      end
    end
  end
end
