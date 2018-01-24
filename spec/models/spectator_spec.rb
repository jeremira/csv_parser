require 'rails_helper'

RSpec.describe Spectator, type: :model do

    let(:spectator)         {build :spectator}
    let(:another_spectator) {build :spectator}

    it 'has a valid factory' do
      expect(spectator).to be_valid
    end
  

end
