defmodule TaskTracker2.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :fname, :lname, :admin])
    |> validate_required([:email, :fname, :lname, :admin])
  end
end
