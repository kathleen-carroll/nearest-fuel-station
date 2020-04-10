class SearchController < ApplicationController
  def index
    search_term = params[:location]
    raw_station = NRELService.nearest_station(search_term)
    @station = Station.new(raw_station)

    raw_directions = GoogleService.get_directions(search_term, @station.street_address)
    @directions = raw_directions.map {|direction| Direction.new(direction)}
  end
end
