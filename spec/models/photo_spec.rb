require 'spec_helper'

RSpec.describe Photo, type: :model do

  it 'is not valid with a name of less than three characters' do
    photo = Photo.new(name: "ph")
    expect(photo).to have(1).error_on(:name)
    expect(photo).not_to be_valid
  end

end