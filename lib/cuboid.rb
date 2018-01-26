
class Cuboid
  
  attr_reader :origin, :height, :width, :length


  def initialize(origin={x:0, y:0, z:0}, length=0, width=0, height=0)
    if !(origin.is_a? Hash) || (!origin[:x] || !origin[:y] || !origin[:z])
      raise "Origin must be of the form {x: , y: , z: }"
    end 

    @origin = origin
    @length = length
    @width = width
    @height = height
  end

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
    @origin[:x] = x 
    @origin[:y] = y 
    @origin[:z] = z
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
  
  #Returns true if the two cuboids intersect each other.  False otherwise.
  #To do this, we first figure out how we can tell if two 1-D objects overlap 
  #Assume two lines have (min1, max1) and (min2, max2)
  #We then see if max1>=min2 && min1<=max2 is true, which means the lines overlap
  #We then repeat this process for each dimension
  #If the cubes overlap in all 3 dimensions, then we return true 
  def intersects?(other)
    ((x_coords.max >= other.x_coords.min && x_coords.min <= other.x_coords.max) && 
    (y_coords.max >= other.y_coords.min && y_coords.min <= other.y_coords.max) && 
    (z_coords.max >= other.z_coords.min && z_coords.min <= other.z_coords.max))
  end

  #Always keep origin the same 
  #The axis is the line on the cuboid that we're keeping the same 
  #I interpreted your directions to mean that the origin point was on a floor, (meaning this isn't a proper R^3 space rotation)
  #To be honest, I was a bit confused by the directions here, so my apologies if this is incorrect
  def rotate(axis)
    raise "axis must be :x, :y, or :z" if ![:x, :y, :z].include?(axis)

    #Swap width and length
    #height corresponds to x 
    if axis == :x 
      @width, @height = @height, @width
    
    #width corresponds to y 
    #swap height and length
    elsif axis == :y 
      @height, @length = @length, @height 
    
    #height corresponds to z
    #swap length and width
    elsif axis == :z 
      @length, @width = @width, @length
    end 
  end 

end
