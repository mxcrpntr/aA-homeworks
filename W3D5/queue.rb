class Queue
    def initialize(el = nil)
        if el.nil?
            @array = []
        else
            @array = [el]
        end
    end
    def enqueue(el)
        @array.push(el)
    end
    def dequeue
        @array.shift
    end
    def peek 
        @array[0]
    end

end