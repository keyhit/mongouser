class A
  def initialize(data)
  @data = data
  end

  def m1
    @data + 1 
    
  end

  def m2
    m1 + 1
  end

  def m3
    puts m2
  end
end

 A.new(12)

