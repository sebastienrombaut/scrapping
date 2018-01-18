require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'

#ici le site qui nous a inspiré
page = Nokogiri::HTML(open('http://blog.neocamino.com/liste-des-incubateurs-a-paris/')) 
final = Hash.new
tab_name = []
tab_site = []
tab_address = []

#je récupère les noms et je les stocke dans un tableau
name = page.css('h2')
name.each do |name|
	tab_name << name.text[3..100]
end
tab_name = tab_name[1..10]

#je récupère les sites web, le selecteur est sympa : l'élément qui suit directement h2
site = page.css('h2 + p a')
site.each do |site|
  tab_site << site['href']

end
# je dédoublonne les sites de mon tableau
tab_site = tab_site.uniq

# j'ajoute à la main un site manquant
tab_site.insert(5,'http://www.agoranov.com/')


#constitution du hash final
for i in(0..10)
	final[tab_name[i]] = tab_site[i]
end

puts "========================================================"
puts "Liste des incubateurs gentillement fournie par Neocamino"
puts "========================================================"
puts final