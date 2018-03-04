class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @indent_lvl = 0
  end

  def method_missing(method, *args, &block)
    tags = args[0] || {}
    str = ""
    str << ("  " * @indent_lvl) if @indent
    str << "<#{method}"
    tags.each_pair do |key, value|
      str << " #{key}='#{value}'"
    end
    if block
      str << ">"
      str << "\n" if @indent
      @indent_lvl += 1
      str << yield
      @indent_lvl -= 1
      str << ("  " * @indent_lvl) if @indent
      str << "</#{method}>"
      str << "\n" if @indent
    else
      str << "/>"
      str << "\n" if @indent
    end
    str
  end
end
