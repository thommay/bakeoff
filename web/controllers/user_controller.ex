defmodule Bakeoff.UserController do
  use Bakeoff.Web, :controller

  alias Bakeoff.User
  alias Bakeoff.Contestant

  plug :scrub_params, "user" when action in [:create, :update]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->

        contestants = Contestant
        |> Contestant.two_unassigned
        |> Repo.all

        Enum.map(contestants, fn item ->
          item = Ecto.Changeset.change(item, user_id: user.id)
          Repo.update(item)
        end)

        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id) |> Bakeoff.Repo.preload [:contestants]
    contestants = user.contestants
                  |> Enum.map(&(&1.name))
                  |> Enum.join(", ")
    conn
    |> put_resp_cookie("id", id, max_age: 14515200)
    |> render("show.html", user: user, contestants: contestants)
  end

end
