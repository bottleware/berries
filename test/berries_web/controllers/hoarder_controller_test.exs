defmodule BerriesWeb.HoarderControllerTest do
  use BerriesWeb.ConnCase

  import Berries.HoardersFixtures

  @create_attrs %{berries: 42, name: "some name"}
  @update_attrs %{berries: 43, name: "some updated name"}
  @invalid_attrs %{berries: nil, name: nil}

  describe "index" do
    test "lists all hoarder", %{conn: conn} do
      conn = get(conn, Routes.hoarder_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Hoarder"
    end
  end

  describe "new hoarder" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.hoarder_path(conn, :new))
      assert html_response(conn, 200) =~ "New Hoarder"
    end
  end

  describe "create hoarder" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hoarder_path(conn, :create), hoarder: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.hoarder_path(conn, :show, id)

      conn = get(conn, Routes.hoarder_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Hoarder"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hoarder_path(conn, :create), hoarder: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Hoarder"
    end
  end

  describe "edit hoarder" do
    setup [:create_hoarder]

    test "renders form for editing chosen hoarder", %{conn: conn, hoarder: hoarder} do
      conn = get(conn, Routes.hoarder_path(conn, :edit, hoarder))
      assert html_response(conn, 200) =~ "Edit Hoarder"
    end
  end

  describe "update hoarder" do
    setup [:create_hoarder]

    test "redirects when data is valid", %{conn: conn, hoarder: hoarder} do
      conn = put(conn, Routes.hoarder_path(conn, :update, hoarder), hoarder: @update_attrs)
      assert redirected_to(conn) == Routes.hoarder_path(conn, :show, hoarder)

      conn = get(conn, Routes.hoarder_path(conn, :show, hoarder))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, hoarder: hoarder} do
      conn = put(conn, Routes.hoarder_path(conn, :update, hoarder), hoarder: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Hoarder"
    end
  end

  describe "delete hoarder" do
    setup [:create_hoarder]

    test "deletes chosen hoarder", %{conn: conn, hoarder: hoarder} do
      conn = delete(conn, Routes.hoarder_path(conn, :delete, hoarder))
      assert redirected_to(conn) == Routes.hoarder_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.hoarder_path(conn, :show, hoarder))
      end
    end
  end

  defp create_hoarder(_) do
    hoarder = hoarder_fixture()
    %{hoarder: hoarder}
  end
end
