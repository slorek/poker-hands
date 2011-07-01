class Hand
  
  include Enumerable
  include Comparable
  
  RANK = [:pair, :two_pairs, :three_of_a_kind, :straight, :flush, :full_house, :four_of_a_kind, :straight_flush]
  
  attr_reader :cards, :type
  
  def initialize(cards)
    if cards.class == Array
      @cards = cards
    else
      @cards = cards.split.collect {|card| Card.new card}
    end
    determine_type
  end
  
  def self.deal(number)
    cards = []
    number.times { cards << Card.sample }
    hand = self.new cards
  end
  
  def <=> other_hand
    score = rank <=> other_hand.rank
    
    # High card rules apply
    if score == 0
      cards = sorted
      other_cards = other_hand.sorted
      while (cards.last.value == other_cards.last.value) and (cards.size > 1) do
        cards.pop
        other_cards.pop
      end
      score = cards.last.value <=> other_cards.last.value      
    end
    
    score
  end
  
  def size
    @cards.size
  end
  
  def rank
    RANK.index(@type)
  end
    
  def pair?
    false
  end
  
  def two_pairs?
    false
  end
  
  def three_of_a_kind?
    false
  end
  
  def straight?
    sorted.last.rank - (sorted.collect { |card| card.rank }.first) == 4
  end
  
  def flush?
    @cards.size == @cards.select {|card| card.suit == @cards.first.suit }.size
  end
  
  def full_house?
    false
  end
  
  def four_of_a_kind?
    false
  end
  
  def straight_flush?
    flush? and straight?
  end
  
  def sorted
    @cards.sort_by { |card| card.rank }
  end
  
  private
    def determine_type
      RANK.each { |rank_type| @type = rank_type if send(rank_type.to_s + '?') }
    end
end