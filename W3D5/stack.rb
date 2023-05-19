class Stack
    def initialize(el = nil)
        if el.nil?
            @array = []
        else
            @array = [el]
        end
    end
  
    def push(el)
      @array.push(el)
    end
  
    def pop
      @array.pop
    end
  
    def peek
      @array[-1]
    end
  end