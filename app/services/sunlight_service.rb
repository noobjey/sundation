class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://congress.api.sunlightfoundation.com")
    # Requests always contain the api key parameter
    connection.query[:apikey] = ENV['sunlight_api_key']
  end

  def legislators(params)
    parse(connection.get("legislators", params))[:results]
  end

  def committees(params)
    parse(connection.get("committees", params))[:results]
  end

  private

  def parse(response)
    # symbolize_names turns the keys into symbols for easier access
    JSON.parse(response.body, symbolize_names: true)
  end
end
