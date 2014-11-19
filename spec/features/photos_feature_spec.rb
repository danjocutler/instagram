require 'rails_helper'

describe 'photos' do

  context 'no photos have been added' do

    it 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos'
      expect(page).to have_link 'Add a photo'
    end

  end

  context 'photos have been added' do
  
  before do
    Photo.create(name: 'test photo')
  end

	  it 'should display photos' do
	    visit '/photos'
	    expect(page).to have_content('test photo')
	    expect(page).not_to have_content('No photos')
	  end

	end

end

describe 'CRUD' do

	context 'creating photos' do

		it 'prompts user to fill out a form, then displays the new photo' do
			visit '/photos'
			click_link 'Add a photo'
			fill_in 'Name', with: 'test photo'
			click_button 'Create Photo'
			expect(page).to have_content 'test photo'
			expect(current_path).to eq '/photos'
		end

	end

	context 'viewing photos' do

	  before do
	    @photo = Photo.create(name:'photo')
	  end

	  it 'lets a user view a photo' do
			visit '/photos'
			click_link 'photo'
			expect(page).to have_content 'photo'
			expect(current_path).to eq "/photos/#{@photo.id}"
	  end

	end

	context 'editing photos' do

	  before do
	    Photo.create(name:'test photo')
	  end

	  it 'lets a user edit a photo' do
			visit '/photos'
			click_link 'Edit test photo'
			fill_in 'Name', with: 'photo'
			click_button 'Update Photo'
			expect(page).to have_content 'photo'
			expect(current_path).to eq '/photos'
	  end

	end

end

