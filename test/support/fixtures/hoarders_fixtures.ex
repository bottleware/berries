defmodule Berries.HoardersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Berries.Hoarders` context.
  """

  @doc """
  Generate a hoarder.
  """
  def hoarder_fixture(attrs \\ %{}) do
    {:ok, hoarder} =
      attrs
      |> Enum.into(%{
        berries: 42,
        name: "some name"
      })
      |> Berries.Hoarders.create_hoarder()

    hoarder
  end
end
