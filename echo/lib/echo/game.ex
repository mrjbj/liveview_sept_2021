defmodule Echo.Game do
  @moduledoc """
  The API of eraser.  It retrieves a phrase from the database to initiate an eraser game
  based upon that phrase.
  """
  alias Echo.Repo
  alias Echo.Game.Eraser
  alias Echo.Library.Passage

  import Ecto.Query

  def new(passage_name) do
    q = from(p in Passage, where: p.name == ^passage_name)
    passage = Repo.one(q)

    Eraser.new(passage.phrase, passage.steps)
  end
end
