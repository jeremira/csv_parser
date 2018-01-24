module DataParser
  require 'csv'

  def self.parse_file file

    CSV.foreach(file.path, quote_char: '"', col_sep: ';', row_sep: :auto, headers: true) do |csv_row|
      attributes = create_attributes_hash_from csv_row
      create_and_update_records attributes
    end
    return true
  end

private
  def self.create_attributes_hash_from row
    { spectacle: { key: row['Cle spectacle'], name: row['Spectacle'] },
                  venue: { key: row['Cle representation'],
                           start_time: DateTime.parse(row['Date representation'] + ' ' + row['Heure representation']),
                           end_time: DateTime.parse(row['Date fin representation'] + ' ' + row['Heure fin representation'])},
                  booking: {ticket_number: row['Numero billet'], booking_number: row['Reservation'],
                            timestamp: DateTime.parse(row['Date reservation'] + ' ' + row['Heure reservation']),
                            price: row['Prix'], product_type: row['Type de produit'], selling_point: row['Filiere de vente']},
                  spectator: {firstname: row['Prenom'], lastname: row['Nom'], email: row['Email'],
                              adress: row['Adresse'], zip_code: row['Code postal'], country: row['Pays'],
                              age: row['Age'], sexe: row['Sexe']}
    }
  end

  def self.create_and_update_records attributes
    spectacle = Spectacle.where(key: attributes[:spectacle][:key]).first_or_create(attributes[:spectacle])
    spectator = Spectator.where(email: attributes[:spectator][:email]).first_or_create(attributes[:spectator])
    venue = spectacle.venues.where(key: attributes[:venue][:key]).first_or_create(attributes[:venue])
    booking = venue.bookings.build(attributes[:booking])
    booking.spectator_id = spectator.id
    booking.save
  end

end
