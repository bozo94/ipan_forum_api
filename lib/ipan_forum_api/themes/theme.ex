defmodule IpanForumApi.Themes.Theme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "themes" do
    field :name, :string
    belongs_to :room, IpanForumApi.Rooms.Room
    has_many :posts, IpanForumApi.Posts.Post, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(theme, attrs) do
    theme
    |> cast(attrs, [:name, :room_id])
    |> validate_required([:name, :room_id])
    |> unique_constraint(:name)
  end
end
