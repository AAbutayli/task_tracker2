defmodule TaskTracker2.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :is_manager, :boolean, default: false
    field :manager_id, :id
    has_many :task, TaskTracker2.Tasks.Task
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :fname, :lname, :admin, :is_manager, :manager_id])
    |> validate_required([:email, :fname, :lname, :admin])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/)
  end
end
