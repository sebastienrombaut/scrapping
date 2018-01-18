require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open('http://blog.neocamino.com/liste-des-incubateurs-a-paris/')) 

name = page.css('h2').text
puts name

