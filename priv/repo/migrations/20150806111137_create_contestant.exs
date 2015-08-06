defmodule Bakeoff.Repo.Migrations.CreateContestant do
  use Ecto.Migration

  def change do
    create table(:contestants) do
      add :name, :string
      add :out, :boolean, default: false
      add :knockedout, :integer
      add :user_id, references(:users)

      timestamps
    end
    create index(:contestants, [:user_id])

  end
end
