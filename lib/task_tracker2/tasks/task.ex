defmodule TaskTracker2.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string
    field :done, :boolean, default: false
    field :duration, :time
    field :name, :string
    belongs_to :user, TaskTracker2.Users.User
    timestamps()
  end

  @optional_fields ~w(user)

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :done, :duration, :user_id])
    |> validate_required([:name, :desc, :done, :duration, :user_id])
  end
end
