defmodule IpanForumApi.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :theme_id, references(:themes), on_delete: :delete_all
      add :user_id, references(:users), on_delete: :delete_all
      add :body, :text 
      timestamps()
    end

  end
end
