require 'rails_helper'

RSpec.describe Spectator, type: :model do

    let(:spectator)         {build :spectator}
    let(:another_spectator) {build :spectator}

    it 'has a valid factory' do
      expect(spectator).to be_valid
    end

    it 'has a default age value = 0' do
      spectator.age = nil
      spectator.save
      expect(spectator.age).to eq 0
    end

    it 'make sure email are valid' do
      spectator.email = 'Babar Poupi&12p)-+.ékjd <test-machin@aol.com> et pastatain 1235é'
      spectator.save
      expect(spectator.email).to eq 'test-machin@aol.com'
    end

    it 'do not save twice the same spectator' do
      spectator.save
      another_spectator.email = spectator.email
      expect(another_spectator).to_not be_valid
    end


end
