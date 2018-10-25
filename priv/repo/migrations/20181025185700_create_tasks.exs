defmodule TaskTracker2.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :desc, :text
      add :done, :boolean, default: false, null: false
      add :duration, :time

      timestamps()
    end

  end
end
