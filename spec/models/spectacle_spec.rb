require 'rails_helper'

RSpec.describe Spectacle, type: :model do

  let(:spectacle)         {build :spectacle}
  let(:another_spectacle) {build :spectacle}

  it 'has a valid factory' do
    expect(spectacle).to be_valid
  end

  it 'do not save twice the same spectacle' do
    spectacle.save
    another_spectacle.key = spectacle.key
    expect(another_spectacle).to_not be_valid
  end

end
