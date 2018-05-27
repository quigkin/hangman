defmodule TextClient.Interact do

  alias TextClient.{State, Player}

  def start() do
    Hangman.new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(game) do
    %State {
      game_service: game,
      tally: Hangman.tally(game),
      prompter: &TextClient.Prompter.accept_move/1
    }
  end

end
