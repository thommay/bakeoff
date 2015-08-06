defmodule Bakeoff.UserTest do
  use Bakeoff.ModelCase

  alias Bakeoff.User

  @valid_attrs %{admin: true, name: "some content", prediction: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
