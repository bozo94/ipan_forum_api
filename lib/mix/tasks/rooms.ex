defmodule Mix.Tasks.Rooms do
  require Logger
  use Mix.Task
  import Ecto.Query
  alias IpanForumApi.Repo
  alias IpanForumApi.Rooms
  def run(args) do
    Mix.Task.run("app.start")
    ["Room1","Room2","Room3","Room4","Room5"]
    |> Enum.each(fn(room_name) -> 
      case Rooms.create_room(%{name: room_name}) do 
        {:ok, room} -> 
          Logger.info "Room #{room_name} created successfully"
        {:error, changeset} ->
          Logger.info "Room #{room_name} not created due to error: #{inspect(changeset.errors)}"
      end
    end)
  end
end