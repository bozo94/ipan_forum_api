defmodule Mix.Tasks.Posts do
  require Logger
  use Mix.Task
  import Ecto.Query
  alias IpanForumApi.Repo
  alias IpanForumApi.Themes
  alias IpanForumApi.Rooms
  alias IpanForumApi.Posts
  alias IpanForumApi.Accounts

  def run(args) do
    Mix.Task.run("app.start")
    admin = Accounts.get_by_username("admin")
    {:ok, post_body} = File.read("lib/mix/tasks/stuff/post_body.html")
    user_id = 
    Themes.list_themes
    |>Enum.each(fn(theme) -> 
        Enum.each(0..5, fn(counter) ->
          post_params = %{
                            name: "#{theme.name} - Post #{counter}", 
                            theme_id: theme.id,
                            body: post_body,
                            user_id: admin.id
                          } 
          case Posts.create_post(post_params) do 
            {:ok, post} ->
              Logger.info "Post #{post.name} created successfully"
            {:error, changeset} ->
              Logger.info "Post not created due to error: #{inspect(changeset)}"
          end
        end)
      end)
  end

end