class ArenasController < AdminsController
    include GameProcess
    before_action :set_default_instances_variables, only: [:index]

    def index
        init_arena

        # on battle creation render arenas with param id if @battle 
        @battle = @battles.last
        if @battle
            @battle_state = check_battle_state(@battle)
            if @battle_state == 'start'
                res = Game.set_session(@battle)
                @battle_state = 'result' if @battle.update_attributes(winner_id: res.result['winner_id'], historic: res.result['historic'])
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
        if battle.winner_id
            @battle_state = 'result'
        else
            @battle_state = 'start'
        end
    end
end
