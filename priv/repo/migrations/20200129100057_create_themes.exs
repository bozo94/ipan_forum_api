defmodule IpanForumApi.Repo.Migrations.CreateThemes do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :name, :string

      timestamps()
    end

    create unique_index(:themes, [:name])
  end
end
