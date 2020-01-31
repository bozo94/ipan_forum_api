defmodule IpanForumApiWeb.Api.V1.PostController do
  use IpanForumApiWeb, :controller
  alias IpanForumApi.Rooms
  alias IpanForumApi.Rooms.Room
  alias IpanForumApi.Themes
  alias IpanForumApi.Themes.Theme
  alias IpanForumApi.Posts
  alias IpanForumApi.Posts.Post

  import Ecto.Query
  import IpanForumApi.Repo

  def index conn, %{"room_id" => room_id, "theme_id" => theme_id} do

    # I know they say "let it crash" but this will cause an error 500 if the room or theme are not found
    # you can return {:ok, record} tuples and use `with ... do ... end` to perform non-intrusive error handling
    room = Rooms.get_room!(room_id)
    theme = Themes.get_theme!(theme_id)

    # You should avoid Ecto queries in the controller, you can create as many aggregate-specific Repo (like you did for rooms and theme)
    posts = IpanForumApi.Repo.all(
      from(
        p in Post,
        where: p.theme_id == ^theme_id
      )
    )
    render conn, "index.json", room: room, theme: theme, posts: posts
  end

  def show conn, %{"room_id" => room_id, "theme_id" => theme_id, "id" => post_id } do
    room = Rooms.get_room!(room_id)
    theme = Themes.get_theme!(theme_id)
    post = Posts.get_post!(post_id)
    render conn, "show.json", room: room, theme: theme, post: post
  end



end
