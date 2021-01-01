require 'yaml'
require_relative 'geocoder'


class SeedGeocoder

  attr_reader :src, :dest, :geocoder

  def initialize( src: 'db/seeds.rb',
                  dest: 'db/newseeds.rb',
                  geocoder: Geocoder )
    @src = src
    @dest = dest
    @geocoder = geocoder.new
  end

  def geocode_seeds
    write(geocoded_seeds)
  end

  def geocoded_seeds
    File.foreach(src).map do |line|
      next unless line.match /number:/
      addr = YAML.load(line)
      addr.merge(geocoder.geocode(addr))
    end.compact
  end

  def write(seeds)
    File.open(dest, 'w') do |f|
      f.puts "[\n"
      seeds.each do |seed|
        f.puts "  #{seed.to_s},\n"
      end
      f.puts "]\n"
    end
  end

end
