class GoogleService
  def self.get_directions(origin, destination)
    get_json(origin, destination)[:routes].first[:legs].first[:steps]
  end

  private

  def self.conn(origin, destination)
    Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json?key=#{ENV['GOOGLE_API_KEY']}&origin=#{origin}&destination=#{destination}")
  end

  def self.get_json(origin, destination)
    response = conn(origin, destination).get
    JSON.parse(response.body, symbolize_names: true)
  end

  # google_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json?key=#{ENV['GOOGLE_API_KEY']}&origin=#{search_term}&destination=#{@station.street_address}")
  # goog_response = google_conn.get
  # g_json = JSON.parse(goog_response.body, symbolize_names: true)
end
