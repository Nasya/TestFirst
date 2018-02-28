def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(array)
  if array.any? && array.size > 1
    suma = array.inject(0){ |res, elem| res + elem} # OR simlpe array.sum
  elsif array.size == 1
    array.at(0)
  else
    0
  end
end

def multiply(a, b)
  a * b
end

def multiply(*num)
  num.inject(1){ |res, n| res * n}
end

def power(a, b)
  a**b
end

def factorial(n)
  (1..n).inject(1) {|a,b| a*b}
end
