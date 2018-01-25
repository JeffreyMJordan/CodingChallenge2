require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.  
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  describe "#initialize" do 
    it "accepts an origin, a height, a width, and a length" do 
      cube = Cuboid.new({x:0, y:0, z:0}, 1, 1, 1)
      expect(cube.origin).to be ==({x:0, y:0, z:0})
      expect(cube.height).to be ==(1)
      expect(cube.width).to be ==(1)
      expect(cube.length).to be ==(1)
    end 

    it "doesn't accept an origin in an improper format" do 
      expect{Cuboid.new([0, 0, 0], 1, 1, 1)}.to raise_error "Origin must be of the form {x: , y: , z: }"
      expect{Cuboid.new({ y:0, z:0}, 1, 1, 1)}.to raise_error "Origin must be of the form {x: , y: , z: }"
    end 
  end 

  describe "#intersects?" do 
    subject(:cube1) {Cuboid.new({x:0, y:0, z:0}, 1, 1, 1)}
    subject(:cube2) {Cuboid.new({x:0, y:0, z:0}, 2, 2, 2)}
    subject(:cube3) {Cuboid.new({x:2, y:2, z:2}, 1, 1, 1)}

    it "returns true when two cubes intersect" do 
      expect(cube1.intersects?(cube2)).to be true
      expect(cube2.intersects?(cube3)).to be true
    end 

    it "returns false when two cubes don't intersect" do 
      expect(cube1.intersects?(cube3)).to be false
    end 

  end 
 
  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3)).to be
    end
  end    
  
  describe "intersects?" do
  end

end
