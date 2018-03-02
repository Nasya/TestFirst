def translate(str)
  alphabet = ('a'..'z').to_a
  vowels = %w[a e i o u]
  consonants = alphabet - vowels
  new_words = ""
  str.split.each do |word|
    idx = 0

    if vowels.include? word[0]
      idx = 0
    elsif word.include? "qu"
      until word[idx-2]+word[idx-1] == "qu"
        idx += 1
      end
    else
      while consonants.include? word[idx]
        idx += 1
      end
    end

    right = idx
    while right < word.length
      new_words += word[right]
      right += 1
    end

    left = 0
    while left < idx
      new_words += word[left]
      left += 1
    end
    new_words += "ay "
  end

  new_words.chomp(" ")
end
