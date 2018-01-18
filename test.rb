require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'
#require 'restclient'


def get_the_email_of_a_townhal_from_its_webpage(url)
  page = Nokogiri::HTML(open(url)) 
  email = page.css('p.Style22')[11]
  
  puts email.text
  
  #binding.pry
end

#get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/ableiges.html')

	
def get_all_the_urls_of_val_doise_townhalls(url)
  page = Nokogiri::HTML(open(url))
  url = page.css('a.lientxt')
  tab = []
  url.each do |townhall|
  	tab << "http://annuraire-des-maires.com"+townhall['href'][1..100]
  end
  #return tab
  #tab = url.map {|lien| lien["href"]}
  #url = "annuaire-des-mairies.com"+"url"
  #puts tab
  #binding.pry


#get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')


final = Hash.new
tab.each do |url_mairie|
  page = Nokogiri::HTML(open(url_mairie))
  name = page.css('a.lientxt').text
  final[name] = get_the_email_of_a_townhal_from_its_webpage(url_mairie)
end
puts final

end

get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')