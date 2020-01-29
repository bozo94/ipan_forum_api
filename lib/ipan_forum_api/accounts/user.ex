defmodule IpanForumApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias IpanForumApi.Accounts.User
  alias Comeonin.Bcrypt

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "users" do
    field :encrypted_password, :string
    field :username, :string
    field :admin, :boolean
    field :first_name, :string
    field :last_name, :string
    field :email, :string, unique: true
    field :headline, :string
    field :phone, :string

    timestamps()
  end


  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :encrypted_password,
                    :first_name, :last_name, :email,
                    :headline, :phone  
                   ])
    |> unique_constraint(:username)
    |> validate_required([:username, :encrypted_password])
    |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
  end
end
