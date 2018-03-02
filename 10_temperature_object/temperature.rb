class Temperature
  def initialize(opt = {})
    @opt = opt
  end

  def in_celsius
    @opt.key?(:c) ? @opt[:c] : (@opt[:f] - 32.0) * (5.0/9.0)
  end

  def in_fahrenheit
    @opt.key?(:f) ? @opt[:f] : (@opt[:c] * (9.0/5.0)) + 32.0
  end

  class << self
    def from_fahrenheit(temp)
      self.new(:f => temp)
    end

    def from_celsius(temp)
      self.new(:c => temp)
    end
  end
end

class Celsius < Temperature
  def initialize(temp, opt = {})
    @opt = opt
    @opt[:c] = temp
  end

  def in_celsius
    super
  end

  def in_fahrenheit
    super
  end
end

class Fahrenheit < Temperature
  def initialize(temp, opt = {})
    @opt = opt
    @opt[:f] = temp
  end

  def in_celsius
    super
  end

  def in_fahrenheit
    super
  end
end
