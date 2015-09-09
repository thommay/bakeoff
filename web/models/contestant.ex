defmodule Bakeoff.Contestant do
  use Bakeoff.Web, :model
  import Ecto.Query

  schema "contestants" do
    field :name, :string
    field :out, :boolean, default: false
    field :knockedout, :integer
    belongs_to :user, Bakeoff.User

    timestamps
  end

  def all_gone(query) do
    from c in query, where: is_nil(c.user_id), select: 1
  end

  def two_unassigned(query) do
    from c in query, where: is_nil(c.user_id), select: c,
      limit: 2, order_by: fragment("random()")
  end

  @required_fields ~w(name out)
  @optional_fields ~w(knockedout)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
