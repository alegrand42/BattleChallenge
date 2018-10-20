class CharactersController < AdminsController
    before_action :set_default_instances_variables, only: [:new, :show, :create, :edit, :update]

    private

    def character_params
        params.require(:character).permit(:name,
                                          :hp,
                                          :attack,
                                          :armor,
                                          :weapon_ids,
                                          :background)
    end

    def set_default_instances_variables
        @weapons = Weapon.all
    end
end
