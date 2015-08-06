defmodule Bakeoff.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :prediction, :string
      add :admin, :boolean, default: false

      timestamps
    end

  end
end
