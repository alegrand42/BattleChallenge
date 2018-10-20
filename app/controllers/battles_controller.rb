class BattlesController < AdminsController
    before_action :set_default_instances_variables, only: [:new, :show, :create, :edit, :update]

    def create
        @battle = Battle.new(battle_params)
        if battle_params['player_one_id'] == battle_params['player_two_id']
            @battle.errors[:base] << ("ERROR: The player can't fight with himself.")
            render :new
        end
        super
    end

    private

    def battle_params
        params.require(:battle).permit(:player_one_id,
                                       :player_two_id,
                                       :historic,
                                       :winner_id,
                                       :turn)
    end

    def set_default_instances_variables
        @characters = Character.all
    end
end
