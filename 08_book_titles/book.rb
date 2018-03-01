class Book
  def title
    @title
  end

  def title=(str)
    @title = titleize(str)
  end

  def titleize(str)
    little_words = %w(end over an a in of and the)
    str.capitalize.gsub(/(\w+)/) do |word|
      little_words.include?(word) ? word : word.capitalize
    end
  end
end
