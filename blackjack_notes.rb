#################
#### Blackjack####
#################

##  added by -Kevin

##  more changes

##a RANDOM CHANGE 


##added my Dev branch- kellie

## MORE PRACTICE ADDING MY OWN DEV BRANCH- ONLY FOR WORKING ON MY MACHINE

#Classes
    #player
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 100)
        #hand (array to store cards)

        class Player
            attr_accessor :name, :bankroll, :total
            attr_reader :cards

            def start_game
                @cards = []
                @total = 0
                @bankroll = 100
                @name = name
            end
            def get_card deck
                @cards = deck.sample(2)
              end
            
        end
        # human = Player.new
    #house
        #create the following accessable properties: *attr_accessor*
        #name
        #bankroll(start with 10,000)
        #hand(array to store cards)

    #card
        #create the following readable properties: 
            #value (between 1 and 11)
            #suit
            #face
        ###every time a card is created, add into the deck array
        ###create 13 individual cards (one set), then make 4 copies to end up with 4 sets
        class Card
            attr_reader :rank, :suit
            attr_accessor :value
            def initialize(rank, suit)
                @rank = rank
                @suit = suit
                @value = 0
                get_card_value
            end
            def get_card_value
                case @rank
                when 2
                    @value = 2
                when 3
                    @value = 3
                when 4
                    @value = 4
                when 5
                    @value = 5
                when 6
                    @value = 6
                when 7
                    @value = 7
                when 8
                    @value = 8
                when 9
                    @value = 9
                when 10, 'J', 'Q', 'K'
                    @value = 10
                when 'A'
                    @value = 11
                end
            end
        end

#The Deck
    #empty array
    class Deck
        attr_reader :deck
        # ranks/suits for each of the cards
        RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
        SUITS = ['♣', '♠', '♥', '♦']
      
        def initialize
          @deck = []
          # i create an empty array called deck and then for I create a new card and pass through a rank and suit and push them into the array
          SUITS.each do |suit|
            RANKS.each do |rank|
              @deck << Card.new(rank, suit)
            end
          end
        end
        #method to randomize the deck
        def shuffle
            @deck = @deck.shuffle
        end
    end
 # spawning the classes below here
    human = Player.new
    computer = Player.new
    new_deck = Deck.new
    # p new_deck.deck
    computer.get_card new_deck.deck
    human.get_card new_deck.deck
    p human 
    p computer
    # randomized the deck we created using shuffle method
    new_deck.shuffle
    
    # prints the new fully shuffled deck that was created
# p new_deck
      


#Gameplay
    #Player chooses their name
        #creates a new player class
    #Game start 

        #method: *deal* two random cards generated for house and player
            #sample method (grabs random items from array)
        #method: *add_cards* adds the two randomly generated cards for house and player
        #method: *compare* compare the total of cards generated for house and player 
        #method: *win* substracts 10 from the losing party and adds 10 to the winning party
            #tie > puts a message to the player. nothing is affected.
        
        ##consider writing a switch case statement to cover all situations



#Parkers total code:
humanTotal = human.cards.reduce(0){|sum, card| sum + card.value} 
computerTotal = computer.cards.reduce(0){|sum, card| sum + card.value}

#Allegra's switch case:
# we need a tie situation, a bust situation (over 21) for both players, and a winning situtation for both players, under 21 and a loosing situation with both ability to replay and inability to replay.
# It could be neat to have the 'pot' where the 100 from each player goes into an array so if there is a tie, the next round increments by another 100.
# Should we break this switch case up into multiple cases? 1. for winning/losing, 2. tie, 3. bust?
# Is the syntax right here?

case game_Outcome
when humanTotal > computerTotal && humanTotal <= 21
    Player.bankroll += 100
    Computer.bankroll -= 100
    p "You win! Don't stop now, play again?"
    new_deck.shuffle
when computerTotal > humanTotal && computerTotal <= 21 && Player.bankroll >= 100
    Computer.bankroll += 100
    Player.bankroll -= 100
    p "No luck this time. But it's worth another try!"
    new_deck.shuffle
when computerTotal > humanTotal && computerTotal <= 21 && Player.bankroll <= 100
    Computer.bankroll += 100
    Player.bankroll -= 100
    p "Time to cool it, your out of money. Better luck next time!"
    #restart
when computerTotal == humanTotal && computerTotal <=21
    p "Close but a tie. Let's draw a new hand."
    new_deck.shuffle
when humanTotal > 21 && Player.bankroll >= 100
    Computer.bankroll += 100
    Player.bankroll -= 100
    p 'Your total is #{humanTotal}. It is a bust. Try again!'
when computerTotal > 21
    Player.bankroll += 100
    Computer.bankroll -= 100
    p 'The dealer went bust. Money is all yours!'
else humanTotal > 21 && Player.bankroll < 100
    Computer.bankroll += 100
    Player.bankroll -= 100
    p 'Your out of money. Take a trip to the bank or maybe sleep this one off.'

