defmodule Bakeoff.PageController do
  use Bakeoff.Web, :controller

  def index(conn, params) do
    if Dict.has_key?(params, "existing") || conn.cookies["id"] do
      contestants = Bakeoff.Contestant |> Repo.all |> Repo.preload [:user]
      render conn, "index.html", contestants: contestants
    else
      redirect(conn, to: user_path(conn, :new))
    end
  end
end
