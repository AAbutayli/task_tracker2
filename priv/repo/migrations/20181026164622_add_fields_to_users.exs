defmodule TaskTracker2.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email])
    alter table(:users) do
      add :manager_id, references(:users), null: true
      add :is_manager, :boolean, default: false, null: false
    end
  end
end
