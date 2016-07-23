#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

base_url = "http://sc.olx.com.br/"

url_index = "#{base_url}/?ot=1&q=Vaca"

index = Nokogiri::HTML(open(url_index))

index.css(".OLXad-list-link").each do |item|
  begin
    name  = item.at_css(".OLXad-list-title").text
    price = item.at_css(".OLXad-list-price").text
    region = item.at_css("OLXad-list-line-2").text

    name = name.upcase
    price = price.strip!
    
  rescue
    puts "Something goes wrong with #{name}"
  ensure
    puts "Product info"
    unless name.empty?
      puts "#{name}   #{price} #{region}"
    end

  end
end