class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query]
      @rides = StartLocation.near(params[:query], 5000).map(&:ride)

    else
      @rides = nil
    end
  end
end
