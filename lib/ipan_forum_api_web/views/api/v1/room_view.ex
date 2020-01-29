defmodule IpanForumApiWeb.Api.V1.RoomView do 
  use IpanForumApiWeb, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, IpanForumApiWeb.Api.V1.RoomView, "room.json")}
  end

  def render("show.json", %{room: room, themes: themes}) do
    %{room: render_one(room, IpanForumApiWeb.Api.V1.RoomView, "room.json"),
      themes: render_many(themes, IpanForumApiWeb.Api.V1.ThemeView, "theme.json")
  }
  end

  def render("room.json", %{room: room}) do
    %{
      id: room.id,
      title: room.name,
    }
  end
end