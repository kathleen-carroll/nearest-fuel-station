class Station
  attr_reader :distance, :fuel_type, :access_times, :city, :state,
              :street_address, :zip, :lat, :long

  def initialize(station_info)
    @distance = station_info['fuel_stations'].first['distance']
    @fuel_type = station_info['fuel_stations'].first['fuel_type_code']
    @access_times = station_info['fuel_stations'].first['access_days_time']
    @city = station_info['fuel_stations'].first['city']
    @state = station_info['fuel_stations'].first['state']
    @street_address = station_info['fuel_stations'].first['street_address']
    @zip = station_info['fuel_stations'].first['zip']
    @lat = station_info['fuel_stations'].first['latitude']
    @long = station_info['fuel_stations'].first['longitude']
  end
end
