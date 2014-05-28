require 'httparty'
require 'nokogiri'

puts "What stock would you like to search?"
stock = gets.upcase.chomp
stock_symbol = stock.downcase

url = "http://finance.yahoo.com/q?s=#{stock}"
response = HTTParty.get(url)

dom = Nokogiri::HTML(response.body)

path = "//span[@id='yfs_l84_#{stock_symbol}']"
my_span = dom.xpath(path).first

puts my_span.content

