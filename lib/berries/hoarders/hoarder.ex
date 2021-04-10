defmodule Berries.Hoarders.Hoarder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hoarder" do
    field :berries, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(hoarder, attrs) do
    hoarder
    |> cast(attrs, [:name, :berries])
    |> validate_required([:name, :berries])
  end
end
