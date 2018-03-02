class RPNCalculator
  attr_accessor :array

  def initialize
    @array = []
  end

  def push(n)
    @array.push(n)
  end

  def size
    @array.size
  end

  def pop
    @array.pop(2)
  end

  def value
    @array[-1]
  end

  def plus
    size > 1 ? push(pop.reduce(:+)) : fail
  end

  def minus
    size > 1 ? push(pop.reduce(:-)) : fail
  end

  def multiplies
    size > 1 ? push(pop.reduce(:*)) : fail
  end

  def divide
    size > 1 ? push(pop.inject{|x,y| x.to_f / y}) : fail 
  end

  def times
    size > 1 ? push(pop.reduce(:*) ) : fail
  end

  def tokens(str)
     str.split.map do |elem|
       "*-/+".include?(elem) ? elem.to_sym : elem.to_i
     end
   end 

  def evaluate(str)
    array = tokens(str)
    array.each do |elem| 
      case elem
      when Integer
        push(elem)
      when :+
        plus 
      when :-
        minus 
      when :*
        times
      when :/
        divide 
      end 
    end
    value  
  end 

  def fail
    begin
      raise Exception.new("calculator is empty")
    end
  end

end
