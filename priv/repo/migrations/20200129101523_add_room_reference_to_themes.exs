defmodule IpanForumApi.Repo.Migrations.AddRoomReferenceToThemes do
  use Ecto.Migration

  def change do
    alter table("themes") do 
      add :room_id, references(:rooms), on_delete: :delete_all
    end
  end
end
