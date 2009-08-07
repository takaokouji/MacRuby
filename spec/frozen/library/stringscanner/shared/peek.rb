describe :strscan_peek, :shared => true do
  before :each do
    @s = StringScanner.new('This is a test')
  end

  it "returns at most the specified number of characters from the current position" do
    @s.send(@method, 4).should == "This"
    @s.pos.should == 0
    @s.pos = 5
    @s.send(@method, 2).should == "is"
    @s.send(@method, 1000).should == "is a test"
  end

  it "returns an empty string when the passed argument is zero" do
    @s.send(@method, 0).should == ""
  end

  it "raises a ArgumentError when the passed argument is negative" do
    lambda { @s.send(@method, -2) }.should raise_error(ArgumentError)
  end

  it "raises a RangeError when the passed argument is a Bignum" do
    lambda { @s.send(@method, bignum_value) }.should raise_error(RangeError)
  end 
  
  it "raises a TypeError when the passed argument is not a Fixnum" do
    lambda { @s.send(@method, "test") }.should raise_error(TypeError)
  end
    
end