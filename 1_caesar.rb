# frozen_string_literal: true

def caesar_cipher(str, shift)
  alphabet = ('a'..'z').to_a
  code = []

  str.split('').each do |letter|
    if alphabet.include?(letter.downcase)
      if letter == letter.upcase
        index = alphabet.find_index(letter.downcase)
        new_index = (index + shift + 26) % alphabet.length
        code << alphabet[new_index].upcase
      elsif letter == letter.downcase
        index = alphabet.find_index(letter)
        new_index = (index + shift + 26) % alphabet.length
        code << alphabet[new_index]
      end
    else
      code << letter
    end
  end
  code.join('')
end

caesar_cipher('What a string!', 5)
caesar_cipher('What a string!', -5)
