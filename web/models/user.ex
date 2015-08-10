defmodule Bakeoff.User do
  use Bakeoff.Web, :model

  schema "users" do
    field :name, :string
    field :prediction, :string
    field :admin, :boolean, default: false
    has_many :contestants, Bakeoff.Contestant

    timestamps
  end

  @required_fields ~w(name prediction admin)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:name, on: Bakeoff.Repo, downcase: true)
  end
end
