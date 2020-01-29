defmodule IpanForumApi.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :name, :string
    field :body, :string
    belongs_to :user, IpanForumApi.Accounts.User
    belongs_to :theme, IpanForumApi.Themes.Theme
    has_many :comments, IpanForumApi.Comments.Comment
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :theme_id, :user_id, :body])
    |> validate_required([:name, :theme_id, :user_id, :body])
    |> unique_constraint(:name)
  end
end
