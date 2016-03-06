class Airport

  attr_reader :planes
  DEFAULT_CAPACITY=20
  
  def initialize(capacity=DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  end


  def arrive(plane, weather)
    fail "this plane has landed already" if plane.status == :landed
    fail "there is a storm" if weather.storm? 
    fail "airport is full" if full?
    plane.landed
    @planes << plane

  end

  def depart(plane, weather)
    fail "this plane does not exist" if @planes.include?(plane) == false
    fail "there is a storm" if weather.storm?
    plane.flying
    @planes.delete(plane)
  end
private
  
  def full?
    planes.length >= @capacity
  end

end