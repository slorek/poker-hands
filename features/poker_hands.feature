Feature: Poker Hands
  In order to decide a winner for the prize
  As a poker player
  I want to rank poker hands according to poker rules:

	#   Scenario: New deck
	# When I have not requested a hand
	# Then there should be 52 cards in the deck
	# 
	#   Scenario: Receiving a hand
	# When I request a hand
	# Then I should receive 5 cards
	# And my partner should receive 5 cards
	# 
	#   Scenario: Comparing hands
	# When one person receives a hand greater than the other
	# Then the greater one should be the winner
	
  Scenario: I receive a straight flush
	When I receive a straight flush
	And my partner does not receive a straight flush
	Then I should be the winner

  Scenario: We both receive a straight flush and mine is higher
	When I receive a high straight flush
	And my partner receives a low straight flush
	Then I should be the winner

  Scenario: We both receive a straight flush and mine is lower
	When we both receive a hand
	And they are both straight flushes
	And the highest card in my hand is lower than my partner's highest card
	Then I should be the loser
	
  Scenario: We both receive a straight flush and both are equal
	When we both receive a hand
	And they are both straight flushes
	And the highest card in my hand is the same as my partner's highest card
	Then it should be a draw
