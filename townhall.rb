
require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require'pry'

#fonction pour lancer la recherche d'un email si on a l'url de la mairie en question
def get_the_email_of_a_townhal_from_its_webpage(url_townhall) 
	url_townhall = Nokogiri::HTML(open(url_townhall))
	email = url_townhall.css("p.Style22")[11].text #position de l'email trouvée grâce à l'inspecteur
	puts url_townhall.css('title').text + "  - email : " + email

end

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/l-isle-adam.html")



#fonction pour afficher toute les adresses email des mairies à partir de la page d'accueil
def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))   

links = page.css("a.lientxt") #commande pour accéder aux balises <a> qui contiennent le nom des mairies et l'url pour accéder à leur page
villes = page.css("a.lientxt").text #.text permet d'afficher seulement le texte de la balise <a> 


table = links.map { |link| link['href'][1..100] } #itération sur chaque balise <a> pour isoler leur url (href) et enlever le point (.)
	table.each do |town_link| #pour chaque bout d'url ...
		
		new_page = "https://annuaire-des-mairies.com" + town_link #reconstitution d'un url entier
		get_the_email_of_a_townhal_from_its_webpage(new_page) #appel à la fonction précédente grâce à notre url
	end

end

get_all_the_urls_of_val_doise_townhalls