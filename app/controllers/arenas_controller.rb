class ArenasController < AdminsController
    include GameProcess
    include ArenasHelper
    before_action :set_default_instances_variables, only: [:index]

    def index
        init_arena

        if params['battle_id']
            @battle = @battles.find(params['battle_id'])
        else
            @battle = @battles.last
        end
        if @battle
            get_player_data
            @battle_state = check_battle_state(@battle)
            if @battle_state == 'start'
                res = Game.set_session(@battle)
                @battle_state = 'result' if @battle.update_attributes(winner_id: res.result['winner_id'], historic: res.result['historic'])
                @winner = Character.find(@battle.winner_id)
                ArenasHelper.set_end_game_stats(res.result, @battle)
            end
        end
    end

    private

    def init_arena
        @battle_state = 'home'
        @battle = nil
    end

    def set_default_instances_variables
        @battles = Battle.all
    end

    def check_battle_state(battle)
        if battle && battle.winner_id
            @battle_state = 'result'
        else
            @battle_state = 'start'
        end
    end

    def get_player_data
        if @battle
            @winner = Character.find(@battle.winner_id) if @battle.winner_id
            @player1 = Character.find(@battle.player_one_id)
            @player2 = Character.find(@battle.player_two_id)
        end
    end

end
