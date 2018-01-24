require 'rails_helper'

RSpec.describe DataParser, type: :model do

  let(:csv_file) {
    CSV.open('test.csv','w', quote_char: '"', col_sep: ';', row_sep: :auto,) do|csv|
      csv << [
        'Numero billet', 'Reservation', 'Date reservation',
        'Heure reservation', 'Cle spectacle', 'Spectacle',
        'Cle representation', 'Représentation', 'Date representation', 'Heure representation',
        'Date fin representation', 'Heure fin representation', 'Prix', 'Type de produit',
        'Filiere de vente', 'Nom', 'Prenom', 'Email', 'Adresse', 'Code postal', 'Pays', 'Age', 'Sexe'
      ]
      csv << [
            '1', '2', '2012/01/01', '16:00:00', '3', 'Martine à la plage', '4', 'Martine representation', '2012/02/02',
            '14:02:00', '2012/03/03', '15:02:00', '99', 'abonnement', 'guichet', 'dupond', 'jean', 'jd@aol.com',
            '13 adress test', '31000', 'france', '75', 'm'
           ]
    end
  }

  describe "#parse_file" do
    context 'No records exists' do
      it 'create Spectacle record' do
        expect{DataParser.parse_file csv_file}.to change(Spectacle, :count).by 1
        expect(Spectacle.last.name).to eq 'Martine à la plage'
        expect(Spectacle.last.key).to eq 3
      end
      it 'create Venue record' do
        expect{DataParser.parse_file csv_file}.to change(Venue, :count).by 1
        expect(Venue.last.key).to eq 4
        expect(Venue.last.start_time).to eq '2012/02/02 14:02:00'
        expect(Venue.last.end_time).to eq   '2012/03/03 15:02:00'
      end
      it 'create Booking record' do
        expect{DataParser.parse_file csv_file}.to change(Booking, :count).by 1
        expect(Booking.last.ticket_number).to eq 1
        expect(Booking.last.booking_number).to eq 2
        expect(Booking.last.timestamp).to eq '2012/01/01 16:00:00'
        expect(Booking.last.price).to eq 99
        expect(Booking.last.product_type).to eq 'abonnement'
        expect(Booking.last.selling_point).to eq 'guichet'
      end
      it 'create Spectator record' do
        expect{DataParser.parse_file csv_file}.to change(Spectator, :count).by 1
        expect(Spectator.last.firstname).to eq 'jean'
        expect(Spectator.last.lastname).to eq 'dupond'
        expect(Spectator.last.email).to eq 'jd@aol.com'
        expect(Spectator.last.adress).to eq '13 adress test'
        expect(Spectator.last.zip_code).to eq 31000
        expect(Spectator.last.country).to eq 'france'
        expect(Spectator.last.age).to eq 75
        expect(Spectator.last.sexe).to eq 'm'
      end
    end

    context 'Spectacle record already exists' do
      before :each {
        Spectacle.create({key: 3, name: 'Martine à la plage'})
      }
      it 'do NOT create Spectacle record' do
        expect{DataParser.parse_file csv_file}.to change(Spectacle, :count).by 0
      end
      it 'create Venue child record' do
        expect{DataParser.parse_file csv_file}.to change(Venue, :count).by 1
        expect(Venue.last.spectacle.key).to eq 3
      end
    end

    context 'Spectator record already exists' do
      before :each {
        Spectator.create(attributes_for :spectator, email: "jd@aol.com")
      }
      it 'do NOT create Spectator record' do
        expect{DataParser.parse_file csv_file}.to change(Spectator, :count).by 0
      end
      it 'create Booking child record' do
        expect{DataParser.parse_file csv_file}.to change(Booking, :count).by 1
        expect(Booking.last.spectator).to eq Spectator.find_by_email("jd@aol.com")
      end
    end

  end

end
