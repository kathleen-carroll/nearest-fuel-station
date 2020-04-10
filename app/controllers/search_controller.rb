class SearchController < ApplicationController
  def index
    search_term = params[:location]

    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{search_term}&fuel_type=ELEC&limit=1")
    response = conn.get
    json = JSON.parse(response.body)

    @station = Station.new(json)
  end
end
