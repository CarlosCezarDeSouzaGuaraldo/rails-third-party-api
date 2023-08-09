require 'net/http'

class Character
  attr_accessor :id

  def initialize(id = nil)
    @id = id.to_i.to_s == id.to_s ? id.to_i : nil
  end

  def valid
    @id.present? && @id.to_i > 0
  end

  def fetch_character_data
    return if !self.valid

    url_base_api = ENV["RICK_AND_MORTY_API_URL"]
    url = URI.parse("#{url_base_api}/#{self.id}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == 'https'

    request = Net::HTTP::Get.new(url)
    response = http.request(request)

    return nil if response.code.to_i >= 400
    JSON.parse(response.body)
  end
end