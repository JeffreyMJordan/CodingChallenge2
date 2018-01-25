
class Cuboid
  attr_reader :origin

  def initialize(origin={x:0, y:0, z:0}, length, width, height)
    @origin = origin

  end
  #BEGIN public methods that should be your starting point

  
  def move_to!(x, y, z)
  end
  
  def vertices
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.

  #How do I tell if they're overlapping? 
  #To do this, we first figure out how we can tell if two 1-D objects overlap 
  # Assume two lines have (min1, max1) and (min2, max2)
  #We then see if max1>=min2 && min1<=max2
  #We then repeat the process for each dimension
  def intersects?(other)
  end

  #END public methods that should be your starting point  
end
