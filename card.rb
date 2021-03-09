class Card
    
    attr_reader :rank, :suit
    attr_accessor :value
  
    def initialize(rank, suit, value)
      @rank = rank
      @suit = suit
      @value = 0
      # get_card_value
    end
  
    # private
    # def get_card_value
    #   case @rank
    #   when 2
    #     @value = 2
    #   when 3
    #     @value = 3
    #   when 4
    #     @value = 4
    #   when 5
    #     @value = 5
    #   when 6
    #     @value = 6
    #   when 7
    #     @value = 7
    #   when 8
    #     @value = 8
    #   when 9
    #     @value = 9
    #   when 10, 'J', 'Q', 'K'
    #     @value = 10
    #   when 'A'
    #     @value = 11
    #   end
    # end
  end
  deck = []

  def create_cards
    RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    SUITS = ['♣', '♠', '♥', '♦']
    RANKS.each do |SUITS|
      SUITS.each do |RANKS|
        deck << Card.new(suit, rank)
      end
    end
  end
create_cards
 
p deck 
 ## create a loop that makes 13 cards and pushes them into the deck

  