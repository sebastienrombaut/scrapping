require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'

#j'ai tenté la mise à jour toute les heures sans succès ...! 
#every :hour do 

table_name = []
table_price = []
table_final = []
final_hash = Hash.new

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/')) 

#ici je récupère les noms des crypto 
crypto_name = page.css('a.currency-name-container')
crypto_name.each do |crypto|
  table_name << crypto.text #j'ajoute chaque crypto dans un tableau
  end

#ici je récupère les cours des crypto
crypto_rate = page.css('a.price')
crypto_rate.each do |price|
  table_price << price.text #j'ajoute chaque prix dans un tableau 
end

#la touche final : je crée un tableau avec chaque hash 
for i in (0..table_name.size-1)
  final_hash[table_name[i]] = table_price[i]
  table_final << final_hash
  final_hash = {}
end

puts table_final

#end
