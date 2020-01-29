defmodule Mix.Tasks.AdminUser do
  require Logger
  use Mix.Task
  import Ecto.Query
  alias IpanForumApi.Repo
  alias IpanForumApi.Accounts
  def run(args) do
    Mix.Task.run("app.start")
    admin_params = %{username: "admin", encrypted_password: "admin", admin: true}
    case Accounts.create_user(admin_params) do
      {:ok, user} -> 
        Logger.info "Admin user created successfully"
      {:error, changeset} -> 
        Logger.info "Admin user not created due to error: #{inspect(changeset)}"
    end 
  end
end





