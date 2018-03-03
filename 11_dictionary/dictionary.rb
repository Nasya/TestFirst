class Dictionary
  attr_accessor :entries

  def initialize
    self.entries = {}
  end

  def add(a)
    if a.is_a? Hash
      entries.merge!(a)
    else
      entries[a] = nil
    end
  end

  def keywords
    entries.keys.sort
  end

  def include?(k)
    entries.has_key?(k)
  end

  def find(str)
    entries.select { |k,v| k =~ /^#{str}/ }
  end

  def printable
    str = []
    new_hash = entries.sort_by { |k, v| k }
    new_hash.each do |k,v|
      str << "[#{k}] \"#{v}\"" 
    end
    str.join("\n")
  end
end
