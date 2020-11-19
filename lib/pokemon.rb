class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(attr_hash={}) 
        attr_hash.each do |key, value|
            if self.respond_to?("#{key.to_s}=")
                self.send("#{key.to_s}=", value)
            end
        end
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end



end
