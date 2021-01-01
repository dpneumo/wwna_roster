require 'json'
require 'httparty'

class Geocoder
  include HTTParty

  URL_GC = "https://maps.googleapis.com/maps/api/geocode/"

  attr_reader :url, :fmt, :city, :state, :keyfile

  def initialize( url: URL_GC,
                  fmt: 'json',
                  city: 'Arlington',
                  state: 'TX',
                  keyfile: 'apikey.txt')
    @url = url
    @fmt = fmt
    @city = city
    @state = state
    @keyfile = keyfile
  end

  def geocode(street_address) #hash
    address = addr(street_address)
    request = req(address)
    response = HTTParty.get(request)
    extract_coordinates(response)
  end

private
  def req(address)
    URL_GC+fmt+"?address=#{ address }&key=#{ apikey }"
  end

  def addr(street_address)
    number = street_address.fetch('number')
    street = street_address.fetch('street')
    city   = street_address.fetch('city', @city)
    state  = street_address.fetch('state', @state)
    "#{number} #{street} #{city} #{state}"
  end

  def extract_coordinates(response)
    JSON.parse(response.body)["results"].first["geometry"]["location"]
  end

  def apikey
    File.open(keyfile) {|f| key = f.read }
  end
end
