class SearchController < ApplicationController
  def index
    search_term = params[:location]

    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{search_term}&fuel_type=ELEC&limit=1")
    response = conn.get
    json = JSON.parse(response.body)

    @station = Station.new(json)

    # require "pry"; binding.pry
    # @station.name
    # @station.street_address
    # @station.city
    # search_term

    google_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json?key=#{ENV['GOOGLE_API_KEY']}&origin=#{search_term}&destination=#{@station.street_address}")
    goog_response = google_conn.get
    g_json = JSON.parse(goog_response.body, symbolize_names: true)

    raw_directions = g_json[:routes].first[:legs].first[:steps]

    @directions = raw_directions.map {|direction| Direction.new(direction)}
  end
end
