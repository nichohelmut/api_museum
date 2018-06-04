require 'json'
require 'open-uri'

puts "Get me longitude"
longResponse = gets.chomp
puts "Get me latitude"
latResponse = gets.chomp

url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?&proximity=#{longResponse},#{latResponse}&
  limit=100&types=poi&access_token=pk.eyJ1IjoidGtoa29rZCIsImEiOiJjamh3Mng2dmEwYndoM3FtZHpyNT
    lxZ2w4In0.0cFFf-1oVAX_KSkuoAgzxg"
latlong = open(url).read
museum = JSON.parse(latlong)
museumHash = Hash.new {|hsh, key| hsh[key] = []}
n = museum["features"].length - 1
for i in 0..n
  t = museum["features"][i]
  placeName = t["text"]
  possibleZip1 = t["context"][1]["text"]
  possibleZip2 = t["context"][0]["text"]
  possibleZip1.count("a-zA-Z") > 0 ? museumHash[possibleZip2] << placeName :
    museumHash[possibleZip1] << placeName
end
puts museumHash


