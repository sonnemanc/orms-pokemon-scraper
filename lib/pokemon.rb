class Pokemon
    
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
       @id = id
       @name = name
       @type = type
       @db = db
    end
    
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        stats = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).first
        Pokemon.new(id: stats[0], name: stats[1], type: stats[2], db: db)
    end
end
