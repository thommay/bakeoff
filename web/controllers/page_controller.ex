defmodule Bakeoff.PageController do
  use Bakeoff.Web, :controller

  def index(conn, _params) do
    case conn.cookies["id"] do
      nil ->
        redirect(conn, to: user_path(conn, :new))
      id ->
        contestants = Bakeoff.Contestant |> Repo.all |> Repo.preload [:user]
        render conn, "index.html", contestants: contestants
    end
  end
end
