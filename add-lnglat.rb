#!/usr/local/rvm/rubies/ruby-2.0.0-p648/bin/ruby

require_relative './moph-code'
require 'pg'

con = PGconn.connect("pg96",5432,nil,nil,"happino","postgres")
sql = "SELECT hcode5 "
sql += "FROM admins "
sql += "WHERE longitude IS NULL OR latitude IS NULL "
res = con.exec(sql)
con.close

res.each do |rec|
  hc5 = rec['hcode5']
  off = Hcode.new(hc5)
  loc = off.location
  lng = loc[:lng]
  lat = loc[:lat]
  puts "lng: #{lng} lat:#{lat}"
end

