defmodule BerriesWeb.HoarderController do
  use BerriesWeb, :controller

  alias Berries.Hoarders
  alias Berries.Hoarders.Hoarder

  def index(conn, _params) do
    hoarder = Hoarders.list_hoarder()
    render(conn, "index.html", hoarder: hoarder)
  end

  def new(conn, _params) do
    changeset = Hoarders.change_hoarder(%Hoarder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hoarder" => hoarder_params}) do
    case Hoarders.create_hoarder(hoarder_params) do
      {:ok, hoarder} ->
        conn
        |> put_flash(:info, "Hoarder created successfully.")
        |> redirect(to: Routes.hoarder_path(conn, :show, hoarder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hoarder = Hoarders.get_hoarder!(id)
    render(conn, "show.html", hoarder: hoarder)
  end

  def edit(conn, %{"id" => id}) do
    hoarder = Hoarders.get_hoarder!(id)
    changeset = Hoarders.change_hoarder(hoarder)
    render(conn, "edit.html", hoarder: hoarder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hoarder" => hoarder_params}) do
    hoarder = Hoarders.get_hoarder!(id)

    case Hoarders.update_hoarder(hoarder, hoarder_params) do
      {:ok, hoarder} ->
        conn
        |> put_flash(:info, "Hoarder updated successfully.")
        |> redirect(to: Routes.hoarder_path(conn, :show, hoarder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hoarder: hoarder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hoarder = Hoarders.get_hoarder!(id)
    {:ok, _hoarder} = Hoarders.delete_hoarder(hoarder)

    conn
    |> put_flash(:info, "Hoarder deleted successfully.")
    |> redirect(to: Routes.hoarder_path(conn, :index))
  end
end
