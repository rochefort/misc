#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'geocoder'

Geocoder.configure(languate: 'ja', units: 'km')

addresses = Geocoder.search('550-0014', prams: { countorycodes: 'ja' })
addresses.each do |address|
  address.data['address_components'].each do |value|
    if value['short_name'] == 'JP'
      lat = address.data['geometry']['location']['lat']
      lng = address.data['geometry']['location']['lng']
      puts "緯度：#{lat}"
      puts "経度：#{lng}"
    end
  end
end
