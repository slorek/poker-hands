class Card
  
  include Comparable
  
  RANK = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
  SUITS = ['C', 'D', 'H', 'S']
  
  attr_reader :value, :suit
  
  def initialize(type)
    if type.class == Hash
      @value = type[:value].to_s
      @suit = type[:suit].to_s
    else
      @value = type[0]
      @suit = type[1]
    end
  end
  
  def self.sample
    self.new :value => RANK.sample, :suit => SUITS.sample
  end
  
  def <=> other_card
    RANK.index(@value) <=> RANK.index(other_card.value)
  end
  
  def to_s
    @value + @suit
  end
  
  def rank
    RANK.index(@value)
  end
end