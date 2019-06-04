class A
  def initialize(data)
  @data = data
  end

  def m1
    puts @data
    puts m2
  end

  def m2
    @data2 = @data + 12
  end
end

nova = A.new(12)
nova.m1
