defmodule IpanForumApiWeb.Api.V1.RoomController do 
  use IpanForumApiWeb, :controller
  alias IpanForumApi.Rooms
  alias IpanForumApi.Rooms.Room
  alias IpanForumApi.Themes
  alias IpanForumApi.Themes.Theme

  import Ecto.Query
  import IpanForumApi.Repo

  def index conn, _params do 
    rooms = Rooms.list_rooms
    render conn, "index.json", rooms: rooms
  end

  def show(conn, %{"id" => id}) do
    room = Rooms.get_room!(id)
    themes = IpanForumApi.Repo.all(
      from(
        t in Theme,
        where: t.room_id == ^id
      )
    )
    render(conn, "show.json", room: room, themes: themes)
  end

end