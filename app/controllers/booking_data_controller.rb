class BookingDataController < ApplicationController

  def new
  end

  def create
    csv_file = params[:csv_file]
    if DataParser.parse_file csv_file
      redirect_to booking_data_path, notice: 'File parsed and added to database!'
    else
      redirect_to booking_data_path, alert: 'Oops, didnt parse that...'
    end
  end

  def show
    def stuff
      csv << ["Numero billet", "Reservation", "Date reservation",
              "Heure reservation", "Cle spectacle", "Spectacle",
              "Cle representation", "Représentation", "Date représentation", "Heure représentation",
              "Date fin représentation", "Heure fin représentation", "Prix", "Type de produit",
              "Filiere de vente", "Nom", "Prenom", "Email", "Adresse", "Code postal", "Age", "Sexe"
             ]
      csv << [
        "1", "2", "2012/01/01", "16:00:00", "3", "Martine à la plage", "4", "Martine representation", "2012/02/02",
        "14:02:00", "2012/03/03", "15:02:00", "99", "abonnement", "guichet", "dupond", "jean", "jd@aol.com",
        "13 adress test", "31000", "france", "75", "m"]
      end
  end

end
