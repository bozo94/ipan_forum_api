defmodule Mix.Tasks.Themes do
  require Logger
  use Mix.Task
  import Ecto.Query
  alias IpanForumApi.Repo
  alias IpanForumApi.Themes
  alias IpanForumApi.Rooms

  def run(args) do
    Mix.Task.run("app.start")
    Rooms.list_rooms
    |>Enum.each(fn(room) -> 
        Enum.each(0..5, fn(counter) -> 
          case Themes.create_theme(%{name: "#{room.name} - Theme #{counter}", room_id: room.id}) do 
            {:ok, theme} ->
              Logger.info "Theme #{theme.name} created successfully"
            {:error, changeset} ->
              Logger.info "Theme not created due to error: #{inspect(changeset)}"
          end
        end)
    end)
  end

end