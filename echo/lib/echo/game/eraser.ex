defmodule Echo.Game.Eraser do
  @moduledoc """
  Eraser structure includes a :phrase (which is word or phrase to be memorized),
  along with a :plan, which is a list of "chunks", each containing the precomputed
  set of letters that will be replaced with a "_" character, to mask the phrase
  to be memorized.

  new: pass in phrase and steps, will initialize the data structure.
  calc_plan: returns a chunked list of lists, with "steps" number of chunks
  get_text: returns the phrase in an eraser struct.
  erase: takes an eraser struct, destructures it into phrase, current mask, and remaining plan,
          returns a new/updated eraser struct with smaller plan and phrase containing more "_" characters.
  replace: takes phrase, turns into letters, compares each letter to position in plan and replaces
            with "_" character, if position matches.
  """
  defstruct [:phrase, :plan]

  def new(phrase, steps) do
    %__MODULE__{phrase: phrase, plan: calc_plan(phrase, steps)}
  end

  def calc_plan(phrase, steps) do
    len = String.length(phrase) - 1
    step_size = ceil(len / steps)
    0..len |> Enum.shuffle() |> Enum.chunk_every(step_size)
  end

  def get_text(eraser) do
    eraser.phrase
  end

  def erase(%{phrase: phrase, plan: [masks | plan]} = game) do
    %{game | plan: plan, phrase: replace(phrase, masks)}
  end

  # masked string for a given step
  defp replace(phrase, masks) do
    phrase
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(fn {letter, index} ->
      if(Enum.member?(masks, index), do: "_", else: letter)
    end)
    |> List.to_string()
  end
end
