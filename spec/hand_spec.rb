require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Hand do
  
  describe "initializers" do
    it "should accept a string" do
      
      hand = Hand.new "2C 3C 4C 5C 6C"
      hand.size.should == 5
    end
    
    it "should accept an array of Card objects" do
      cards = []
      5.times { cards << Card.sample }
      
      hand = Hand.new cards
      hand.size.should == 5
    end
    
    it "should deal" do
      
      hand = Hand.deal 5
      hand.size.should == 5
    end
  end
  
  describe "type detector" do
    
    it "detects a straight flush" do
      hand = Hand.new "2C 3C 4C 5C 6C"
      hand.type.should == :straight_flush
      hand.straight?.should be_true
      hand.flush?.should be_true
      hand.straight_flush?.should be_true
    end

    it "detects a straight" do
      hand = Hand.new "2C 3D 4C 5D 6C"
      hand.type.should == :straight
      hand.straight?.should be_true
    end
  
    it "detects a flush" do
      hand = Hand.new "2C 3C 4C 5C 8C"
      hand.type.should == :flush
      hand.flush?.should be_true
    end
  end
  
  describe "sorting" do
    it "sorts a hand" do
      hand = Hand.new "KC 8C JC 6C 2C"
      sorted_hand = Hand.new "2C 6C 8C JC KC"
      hand.sorted.should == sorted_hand.sorted
    end
  end
  
  describe "ranking" do
    it "determines a rank for a hand" do
      hand = Hand.new "2C 3D 4C 5D 6C"
      hand.rank.should eq Hand::RANK.index(:straight)
    end
    
    it "compares hands correctly" do
      straight_flush = Hand.new "2C 3C 4C 5C 6C"
      straight = Hand.new "2C 3D 4C 5D 6C"
      
      straight_flush.should be > straight
      straight.should be < straight_flush
    end
  end
end
