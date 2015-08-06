defmodule Bakeoff.ContestantTest do
  use Bakeoff.ModelCase

  alias Bakeoff.Contestant

  @valid_attrs %{knockedout: 42, name: "some content", out: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contestant.changeset(%Contestant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contestant.changeset(%Contestant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
