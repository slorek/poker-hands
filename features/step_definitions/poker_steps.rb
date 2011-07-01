When /^one person receives a hand greater than the other$/ do
  
  @hands = [pair,
		        three_of_a_kind]
end

Then /^the greater one should be the winner$/ do
  result = Hand.compare(@hands.first, @hands.last)
  result.should eq @hands.last
end

When /^I receive a straight flush$/ do
  @hands = [straight_flush]
end

When /^my partner does not receive a straight flush$/ do
  @hands << pair
end

When /^I receive a high straight flush$/ do
  @hands ||= []
  @hands << straight_flush(2)
end

When /^my partner receives a low straight flush$/ do
  @hands ||= []
  @hands << straight_flush(4)
end

Then /^I should be the winner$/ do
  result = Hand.compare(@hands.first, @hands.last)
  result.should eq @hands.first
end

def pair
  [[2, random_suit], [2, random_suit], [3, random_suit], [4, random_suit], [5, random_suit]]
end

def two_pairs
  [[2, random_suit], [2, random_suit], [3, random_suit], [3, random_suit], [4, random_suit]]
end

def three_of_a_kind
  [[2, random_suit], [2, random_suit], [2, random_suit], [3, random_suit], [4, random_suit]]
end

def straight
  [[2, random_suit], [2, random_suit], [4, random_suit], [5, random_suit], [6, random_suit]]
end

def flush
  [[2, 'C'], [3, 'C'], [4, 'C'], [5, 'C'], [7, 'C']]
end

def full_house
  [[2, random_suit],[2, random_suit],[3, random_suit],[3, random_suit], [3, random_suit]]
end

def four_of_a_kind
  [[2,random_suit],[2,random_suit],[2,random_suit],[2,random_suit],[3,random_suit]]
end

def straight_flush(start = 2)
  
  start = Hand::RANK.index(start)
  
  hand = []
  suit = Hand::SUITS.sample
  
  5.times do |i|
    hand << Hand::RANK[i+start]
  end
end

def random_suit
  Hand.random_suit
end