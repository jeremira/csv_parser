require 'rails_helper'

RSpec.describe Spectacle, type: :model do

  let(:spectacle)         {build :spectacle}
  let(:another_spectacle) {build :spectacle}

  it 'has a valid factory' do
    expect(spectacle).to be_valid
  end
end
