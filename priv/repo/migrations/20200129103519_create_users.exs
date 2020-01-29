defmodule IpanForumApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :encrypted_password, :string
      add :admin, :boolean, default: false
      add :first_name, :string
      add :last_name, :string
      add :email, :string, unique: true
      add :headline, :string
      add :phone, :string
      timestamps()
    end
  end
end
