class NRELService
  def self.nearest_station(search_location)
    get_json(search_location)
  end

  private

  def self.conn(search_location)
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{search_location}&fuel_type=ELEC&limit=1").get
  end

  def self.get_json(search_location)
    JSON.parse(conn(search_location).body)
  end
end
