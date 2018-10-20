module GameProcess
    extend ActiveSupport::Concern

    class Game

        attr_reader :player1, :player2
        
        def self.set_session(battle)
            @session = Game.new(battle)
        end

        def self.session
            @session
        end

        def result
            @result
        end

        def set_result(player)
            @result = {
                'winner_id' => player.id,
                'historic' => @result,
                'xp' => @exp,
                'level_up' => @level_up
            }
        end

        def play
            begin
                if @turn % 2 == 0
                    @hp2 = attack(@player_1, @hp2, @player_2)
                else
                    @hp1 = attack(@player_2, @hp1, @player_1)
                end
            end while @hp1 > 0 && @hp2 > 0
            @hp1 > 0 ? set_exp(@player_2, @turn, @player_1) : set_exp(@player_1, @turn, @player_2)
            @hp1 > 0 ? set_result(@player_1) : set_result(@player_2)
        end

        private

        def attack(attacker, hp, defender)
            amount = 0
            shield = 0
            shield += defender.armor if defender.armor
            attacker.weapons.each do |w|
                amount += w.power if w.shield === false
            end
            defender.weapons.each do |w|
                shield += w.power if w.shield === true
            end
            amount += attacker.attack
            amount -= shield
            @result += add_comment(attacker, defender, amount)
            @turn += 1
            receive_damage(hp, amount)
        end

        def add_comment(attacker, defender, amount)
            return "#{attacker.name} hits #{defender.name} who tooks #{amount} damages." if amount > 0
            "#{attacker.name} misses his target."
        end

        def set_exp(loser, turn, winner)
            (10 - turn) > 0 ? xp = 10 - turn : xp = 0
            @exp = xp + 2 * loser.level
            xp_count = winner.exp - winner.level * 100.0 + @exp
            @level_up = true if  xp_count > 100.0
        end

        def receive_damage(hp, amount)
            hp - amount < 0 ? hp = 0 : hp = hp - amount
        end

        def roll_dice(val)
            dice = rand(1..6)
            return val if val >= dice
            0
        end

        def initialize(battle)
            @player_1 = Character.where(id: battle.player_one_id).to_a.first
            @player_2 = Character.where(id: battle.player_two_id).to_a.first
            @hp1 = @player_1.hp
            @hp2 = @player_2.hp
            @turn = 0
            @result = ""
            @exp = 0
            @level_up = false
            
            play
        end
        
    end
end
