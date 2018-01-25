
class Cuboid
  attr_reader :origin, :height, :width, :length


  #I'm assuming no negative length
  def initialize(origin={x:0, y:0, z:0}, length=0, width=0, height=0)

    if !(origin.is_a? Hash) || (!origin[:x] || !origin[:y] || !origin[:z])
      raise "Origin must be of the form {x: , y: , z: }"
    end 

    @origin = origin
    @length = length
    @width = width
    @height = height
    

  end
  #BEGIN public methods that should be your starting point

  def x_coords
    [@origin[:x], @origin[:x] + @length]
  end 

  def y_coords
    [@origin[:y], @origin[:y] + @width]
  end 

  def z_coords 
    [@origin[:z], @origin[:z] + @height]
  end 
  
  def move_to!(x, y, z)
    @origin[:x] += x 
    @origin[:y] += y 
    @origin[:z] += z
  end
  

  #Each cube has 8 vertices
  def vertices
    vertices_arr = []
    x_coords.each do |x| 
      y_coords.each do |y| 
        z_coords.each do |z| 
          vertices_arr << {x: x, y: y, z: z}
        end 
      end 
    end
    vertices_arr 
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.

  #How do I tell if they're overlapping? 
  #To do this, we first figure out how we can tell if two 1-D objects overlap 
  # Assume two lines have (min1, max1) and (min2, max2)
  #We then see if max1>=min2 && min1<=max2
  #We then repeat the process for each dimension
  #If they overlap in all 3 dimensions, then we return true 
  def intersects?(other)
    ((x_coords.max >= other.x_coords.min && x_coords.min <= other.x_coords.max) && 
    (y_coords.max >= other.y_coords.min && y_coords.min <= other.y_coords.max) && 
    (z_coords.max >= other.z_coords.min && z_coords.min <= other.z_coords.max))
  end

  #END public methods that should be your starting point  
end
