# frozen_string_literal: true

def substrings(sentence, dictionary)
  words = sentence.downcase.split(' ')
  result = Hash.new(0)

  words.each do |word|
    dictionary.each do |item|
      result[item] += 1 if word.include?(item)
    end
  end

  result
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

substrings('below', dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
