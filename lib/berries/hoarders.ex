defmodule Berries.Hoarders do
  @moduledoc """
  The Hoarders context.
  """

  import Ecto.Query, warn: false
  alias Berries.Repo

  alias Berries.Hoarders.Hoarder

  @doc """
  Returns the list of hoarder.

  ## Examples

      iex> list_hoarder()
      [%Hoarder{}, ...]

  """
  def list_hoarder do
    Repo.all(Hoarder)
  end

  @doc """
  Gets a single hoarder.

  Raises `Ecto.NoResultsError` if the Hoarder does not exist.

  ## Examples

      iex> get_hoarder!(123)
      %Hoarder{}

      iex> get_hoarder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hoarder!(id), do: Repo.get!(Hoarder, id)

  @doc """
  Creates a hoarder.

  ## Examples

      iex> create_hoarder(%{field: value})
      {:ok, %Hoarder{}}

      iex> create_hoarder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hoarder(attrs \\ %{}) do
    %Hoarder{}
    |> Hoarder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hoarder.

  ## Examples

      iex> update_hoarder(hoarder, %{field: new_value})
      {:ok, %Hoarder{}}

      iex> update_hoarder(hoarder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hoarder(%Hoarder{} = hoarder, attrs) do
    hoarder
    |> Hoarder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hoarder.

  ## Examples

      iex> delete_hoarder(hoarder)
      {:ok, %Hoarder{}}

      iex> delete_hoarder(hoarder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hoarder(%Hoarder{} = hoarder) do
    Repo.delete(hoarder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hoarder changes.

  ## Examples

      iex> change_hoarder(hoarder)
      %Ecto.Changeset{data: %Hoarder{}}

  """
  def change_hoarder(%Hoarder{} = hoarder, attrs \\ %{}) do
    Hoarder.changeset(hoarder, attrs)
  end
end
