class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError     < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  p1, p2 = game
  name1, strat1 = p1[0], p1[1]
  name2, strat2 = p2[0], p2[1]
  valid = ["R", "P", "S"]
  raise NoSuchStrategyError unless valid.include?(strat1) && valid.include?(strat2)

  relacoes = {'R' => 'S', 'S' => 'P', 'P' => 'R'}
  if strat1 == strat2 || relacoes[strat1] == strat2
    [name1,strat1]
  else
    [name2,strat2]
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    return rps_game_winner(tournament)
  else
    # Caso contrário, resolve recursivamente cada lado do torneio
    left_winner = rps_tournament_winner(tournament[0])
    right_winner = rps_tournament_winner(tournament[1])
    return rps_game_winner([left_winner, right_winner])
  end
end

p rps_game_winner([["Kristen","R"],["Pam","S"]])  

tournament = [
  [
    [ ["Kristen", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]

p rps_tournament_winner(tournament)
