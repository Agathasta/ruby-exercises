
def substrings(sentence, dictionary)

    words = sentence.downcase.split(" ")
    result = Hash.new(0)

    words.each do |word|
        dictionary.each do |item|
            if word.include?(item)
                result[item] += 1
            end
        end
    end

return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)