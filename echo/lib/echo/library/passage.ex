defmodule Echo.Library.Passage do
  @moduledoc """
  1. An ecto schema file for passeges table. Contains a "name" for passage to guess,
     the "phrase" that is the passage itself, and the number of "steps" that are allowed to guess/remember it.
  2. Also contains a changeset definition which allows us to raise-up only valid data structure for
     insert/update/delete into the database.
  """
  use Ecto.Schema
  import Ecto.Changeset

  # schema is a macro that implements a "Select *" query
  schema "passages" do
    field(:name, :string)
    field(:phrase, :string)
    field(:steps, :integer)

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:name, :phrase, :steps])
    |> validate_required([:name, :phrase, :steps])
    |> validate_length(:phrase, min: 4)
  end
end
