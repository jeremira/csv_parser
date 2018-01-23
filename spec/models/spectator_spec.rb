require 'rails_helper'

RSpec.describe Spectator, type: :model do

    let(:spectator)         {build :spectator}
    let(:another_spectator) {build :spectator}

    it 'has a valid factory' do
      expect(spectator).to be_valid
    end
    it 'has an unique email' do
      spectator.save
      another_spectator.email = spectator.email
      expect(another_spectator).to_not be_valid
    end

end
