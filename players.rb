class Player
    attr_accessor :name, :bankroll, :total
    attr_reader :cards

    def initialize name
        @name = name
    end
end

human = Player.new "Marsallis"
p human
