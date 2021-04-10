defmodule Berries.Repo.Migrations.CreateHoarder do
  use Ecto.Migration

  def change do
    create table(:hoarder) do
      add :name, :string
      add :berries, :integer

      timestamps()
    end
  end
end
