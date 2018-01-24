module DataParser
  require 'csv'

  def self.parse_file file

    CSV.foreach(file.path, headers: true) do |row|
      puts row[22]
      attributes = {spectacle: { key: row[4], name: row[5] },
                    venue: { key: row[6], start_time: DateTime.parse(row[8] + ' ' + row[9]),
                             end_time: DateTime.parse(row[10] + ' ' + row[11])},
                    booking: {ticket_number: row[0], booking_number: row[1],
                              timestamp: DateTime.parse(row[2] + ' ' + row[3]), price: row[12],
                              product_type: row[13], selling_point: row[14]},
                    spectator: {firstname: row[16], lastname: row[15], email: row[17],
                                adress: row[18], zip_code: row[19], country: row[20],
                                age: row[21], sexe: row[22]}
                  }
      spectacle = Spectacle.new(attributes[:spectacle])
      spectacle.save
      spectator = Spectator.new(attributes[:spectator])
      spectator.save
      venue = spectacle.venues.build(attributes[:venue])
      venue.save
      booking = venue.bookings.build(attributes[:booking])
      booking.spectator_id = spectator.id
      booking.save

    end

  end

  private

end
