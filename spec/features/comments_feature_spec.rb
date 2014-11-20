require 'rails_helper'

describe 'commenting' do
  before do
    Photo.create(name: 'test photo')
  end

  it 'allows users to make a comment using a form' do
     visit '/photos'
     click_link 'Comment'
     fill_in "Thoughts", with: "so so"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('so so')
  end

end