def reverser
  str = []
  yield.split.each{ |word| str << word.reverse }
  str.join(" ")
end

def adder(n = 1)
  yield + n
end

def repeater(n = 1)
  (1..n).each { yield }
end
