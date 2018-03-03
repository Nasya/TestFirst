module InWords
  def in_words
    sentence = ""
    one_to_twenty = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 =>  'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
    big_numbers = { 10**12 => ' trillion', 10**9 => ' billion', 10**6 => ' million', 10**3 => ' thousand', 10**2 => ' hundred', 90 => 'ninety', 80 => 'eighty', 70 => 'seventy', 60 => 'sixty', 50 => 'fifty', 40 => 'forty', 30 => 'thirty', 20 => 'twenty'}
    number = self
    case 
    when one_to_twenty.has_key?(number)
      word = one_to_twenty[number]
    when number >= 20 
      begin
        array = big_numbers.find { |key, value| key <= number }
        val = number / array[0]
        number %= array[0]
        if val > 0 
          w = array[0] >= 100 ? val.in_words : ""
          sentence += w + array[1]
        end
        sentence += " " if number > 0
      end until number < 20
      sentence += one_to_twenty[number] if number > 0
      sentence
    else
      "Some other number"
    end
  end
end
 
class Fixnum
  include InWords
end
 
class Bignum
  include InWords
end
