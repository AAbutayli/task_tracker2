defmodule TaskTracker2.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string
    field :done, :boolean, default: false
    field :duration, :time
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :done, :duration])
    |> validate_required([:name, :desc, :done, :duration])
  end
end
