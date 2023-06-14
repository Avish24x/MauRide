class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @VILLE_NAME = [ " Port-Louis	", "
      Grand Baie	", "
      Flic-en-Flac	", "
      Le Morne Brabant	", "
      Trou aux Biches	", "
      Belle Mare	", "
      Black River Gorges National Park	", "
      Chamarel	", "
      Tamarin	", "
      Mahebourg	"
    ]
    if params[:query]
      @rides = StartLocation.near(params[:query], 5000).map(&:ride)

    else
      @rides = nil
    end
  end
end
