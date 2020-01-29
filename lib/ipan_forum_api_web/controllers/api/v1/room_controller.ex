defmodule IpanForumApiWeb.Api.V1.RoomController do 
  use IpanForumApiWeb, :controller
  alias IpanForumApi.Rooms
  alias IpanForumApi.Rooms.Room

  def index conn, _params do 
    rooms = Rooms.list_rooms
    render conn, "index.json", rooms: rooms
  end

  def show(conn, %{"id" => id}) do
    room = Rooms.get_room!(id)
    render(conn, "show.json", room: room)
  end

end