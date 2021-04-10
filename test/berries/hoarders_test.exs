defmodule Berries.HoardersTest do
  use Berries.DataCase

  alias Berries.Hoarders

  describe "hoarder" do
    alias Berries.Hoarders.Hoarder

    import Berries.HoardersFixtures

    @invalid_attrs %{berries: nil, name: nil}

    test "list_hoarder/0 returns all hoarder" do
      hoarder = hoarder_fixture()
      assert Hoarders.list_hoarder() == [hoarder]
    end

    test "get_hoarder!/1 returns the hoarder with given id" do
      hoarder = hoarder_fixture()
      assert Hoarders.get_hoarder!(hoarder.id) == hoarder
    end

    test "create_hoarder/1 with valid data creates a hoarder" do
      valid_attrs = %{berries: 42, name: "some name"}

      assert {:ok, %Hoarder{} = hoarder} = Hoarders.create_hoarder(valid_attrs)
      assert hoarder.berries == 42
      assert hoarder.name == "some name"
    end

    test "create_hoarder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hoarders.create_hoarder(@invalid_attrs)
    end

    test "update_hoarder/2 with valid data updates the hoarder" do
      hoarder = hoarder_fixture()
      update_attrs = %{berries: 43, name: "some updated name"}

      assert {:ok, %Hoarder{} = hoarder} = Hoarders.update_hoarder(hoarder, update_attrs)
      assert hoarder.berries == 43
      assert hoarder.name == "some updated name"
    end

    test "update_hoarder/2 with invalid data returns error changeset" do
      hoarder = hoarder_fixture()
      assert {:error, %Ecto.Changeset{}} = Hoarders.update_hoarder(hoarder, @invalid_attrs)
      assert hoarder == Hoarders.get_hoarder!(hoarder.id)
    end

    test "delete_hoarder/1 deletes the hoarder" do
      hoarder = hoarder_fixture()
      assert {:ok, %Hoarder{}} = Hoarders.delete_hoarder(hoarder)
      assert_raise Ecto.NoResultsError, fn -> Hoarders.get_hoarder!(hoarder.id) end
    end

    test "change_hoarder/1 returns a hoarder changeset" do
      hoarder = hoarder_fixture()
      assert %Ecto.Changeset{} = Hoarders.change_hoarder(hoarder)
    end
  end
end
