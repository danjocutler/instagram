require 'rails_helper'

describe 'photos' do
  context 'no photos have been added' do
      it 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos'
      expect(page).to have_link 'Add a photo'
    end
  end
end