class WeaponsController < AdminsController

    private

    def weapon_params
        params.require(:weapon).permit(:name,
                                          :detail,
                                          :power,
                                          :type)
    end

end
