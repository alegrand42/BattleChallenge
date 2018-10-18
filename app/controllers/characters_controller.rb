class CharactersController < AdminsController

    private

    def character_params
        params.require(:character).permit(:name,
                                          :hp,
                                          :attack,
                                          :armor,
                                          :background)
    end

end
