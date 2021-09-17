json.set! "pokemon" do 
    json.set! @pokemon.id do
        json.id @pokemon.id
        json.name @pokemon.name
        json.attack @pokemon.attack
        json.defense @pokemon.defense
        json.poke_type @pokemon.poke_type
        json.image_url @pokemon.image_url

    end
end

json.set! "moves" do 
    json.set! @pokemon.id do
     

    end
end
