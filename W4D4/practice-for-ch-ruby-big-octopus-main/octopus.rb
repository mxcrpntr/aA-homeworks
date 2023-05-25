def sluggish(fish)
    longest = ""
    candidate = nil
    (0...fish.length-1).each do |i|
        (i+1...fish.length).each do |j|
            if fish[i].length >= fish[j].length
                candidate = fish[i]
            else
                candidate = fish[j]
            end
            longest = candidate if candidate.length >= longest.length
        end
    end
    return longest
end

def dominant(fish)
    return fish if fish.length <= 1 
    mid = fish.length / 2
    left = fish[0...mid]
    right = fish[mid..-1]
    merge(dominant(left),dominant(right))[-1]
end

def merge(left,right)
    merged = []
    until left.empty? || right.empty?
        if left[0].length < right[0].length
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end