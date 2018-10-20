module ArenasHelper

    def self.set_end_game_stats(res, battle)
        res['winner_id'] == battle.player_one_id ? loser_id = battle.player_two_id : loser_id = battle.player_one_id
        winner = Character.find(res['winner_id'])
        loser = Character.find(loser_id)

        if res['level_up'] == true
            winner.update_attributes(exp: winner.exp + res['xp'], level: winner.level + 1, win_count: winner.win_count + 1)
        else
            winner.update_attributes(exp: winner.exp + res['xp'], win_count: winner.win_count + 1)
        end
        loser.update_attributes(lose_count: loser.lose_count + 1)
    end
end
