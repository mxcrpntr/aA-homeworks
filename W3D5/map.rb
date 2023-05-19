class Map
    def initialize(el = nil)
        @hash = Hash.new(0)
        if !el.nil?
            @hash[el[0]] = el[1]
        end
    end
    def set(key,value)
        @hash[key] = value
    end
    def delete(key,value)
        new_hash = Hash.new(0)
        @hash.each do |k,v|
            if !(k == key && v == value)
                new_hash[k] = v
            end
        end
        @hash = new_hash
    end
    def show
        @hash
    end
end