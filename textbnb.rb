require './home.rb'

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Carlito's place", "Detroit", 2, 12),
  Home.new("Koopa's place", "Zaragoza", 7, 27),
  Home.new("Maikel's place", "Agrabah", 3, 31),
  Home.new("Luigi's place", "Kaliningrado", 8, 55),
  Home.new("Peach's place", "Saint Malo", 11, 14)
]
def mostrar_casas(homes)
  homes.each do |hm|
   puts hm.name + " Price: " + "$" + hm.price.to_s + " a night" + ", " + hm.city + ", " + hm.capacity.to_s + ", " + hm.price.to_s
  end
end  


def ordenar_casas(homes)
  puts "Introduzca el criterio de ordenación: capacity, highest price...."  
  input = gets.chomp
  if input == "capacity"
    sorted_homes = homes.sort do |home1, home2|
     home1.capacity <=> home2.capacity
    end
  elsif input == "highest price"
    sorted_homes = homes.sort do |home1, home2|
      home1.price <=> home2.price
    end
    sorted_homes.reverse!
   else
     sorted_homes = homes.sort do |home1, home2|
      home1.price <=> home2.price
     end
   end 
   sorted_homes
end

def filtrar_ciudad(homes)
    puts "Introduzca la ciudad a filtrar"
    input = gets.chomp
    filtered_homes = homes.select do |hm|
      hm.city == input
    end
    filtered_homes

end  

def average_price(homes)
    average_price = homes.reduce(0.0){ |sum, hm| sum + hm.price }
    average_price /= homes.length
end    

def find_price(homes, price)
    home_given_price = homes.find do |hm|  
      hm.price == price
    end 
    home_given_price 
end

mostrar_casas(homes)

casas_ordenadas = ordenar_casas(homes)
mostrar_casas(casas_ordenadas)

casas_filtradas = filtrar_ciudad(homes)
mostrar_casas(casas_filtradas)

puts "Precio medio: " + average_price(homes).to_s + "EUR"
  
     
casas_precio_x = find_price(homes, 55)
mostrar_casas([casas_precio_x])


