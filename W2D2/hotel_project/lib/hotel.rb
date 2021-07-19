require_relative "room"

class Hotel
   def initialize(name, capacities)
        @name = name 
        @rooms = {}
        
        capacities.each do |room_name, capacities|
            @rooms[room_name] = Room.new(capacities)
            end 
    end 

    def name 
        words = @name.split(' ')
        new_name = words.map { |word| word.capitalize } 
        new_name.join(' ')
    end 

    def rooms
        @rooms 
    end 

    def room_exists?(name)
        @rooms.keys.include?(name) ? true : false 
    end 

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if rooms[room_name].add_occupant(person)
                puts "check in successful"
            else 
                puts "sorry, room is "
            end 
        else 
            puts "sorry, room does not exist"
        end
    end 

    def has_vacancy?
        rooms.values.any? {|room| room.available_space > 0 }
    end 

    def list_rooms
        @rooms.each do |k, v|
            "#{k} has #{v.available_space} rooms open"
        end 
    end 
 
end
