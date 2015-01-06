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
  
	  it 'should display photos' do
	    Photo.create(name: 'test photo')
	    visit '/photos'
	    expect(page).to have_content('test photo')
	    expect(page).not_to have_content('No photos')
	  end

	end

end

describe 'CRUD' do

	  before do
	    @photo = Photo.create(name:'photo')
	    visit '/'
			click_link 'Sign up'
			fill_in 'Email', with: 'test@test.com'
			fill_in 'Password', with: '12345678' 
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up' 
	  end

	context 'creating photos' do

		it 'prompts user to fill out a form, then displays the new photo' do
			click_link 'Add a photo'
			fill_in 'Name', with: 'test photo'
			click_button 'Create Photo'
			expect(page).to have_content 'test photo'
			expect(current_path).to eq '/photos'
		end

	end

	 context 'an invalid photo' do

    it 'does not let you submit a name that is too short' do
      click_link 'Add a photo'
      fill_in 'Name', with: 'ph'
      click_button 'Create Photo'
      expect(page).not_to have_css 'h2', text: 'ph'
      expect(page).to have_content 'error'
    end

  end

	context 'viewing photos' do

	  it 'lets a user view a photo' do
			click_link 'photo'
			expect(page).to have_content 'photo'
			expect(current_path).to eq "/photos/#{@photo.id}"
	  end

	end

	context 'editing photos' do

	  it 'lets a user edit a photo' do
			click_link 'Edit photo'
			fill_in 'Name', with: 'photo'
			click_button 'Update Photo'
			expect(page).to have_content 'photo'
			expect(current_path).to eq '/photos'
	  end

	end

	context 'deleting photos' do

		it 'removes a photo when a user clicks a delete link' do
			click_link 'Delete photo'
			expect(page).not_to have_content 'test photo'
			expect(page).to have_content 'Photo deleted successfully'
		end
	end

end

