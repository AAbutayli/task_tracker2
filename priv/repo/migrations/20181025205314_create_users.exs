defmodule TaskTracker2.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :fname, :string
      add :lname, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
