defmodule Mix.Tasks.AdminUser do
  require Logger
  use Mix.Task
  import Ecto.Query
  alias IpanForumApi.Repo
  alias IpanForumApi.Accounts

  # Nice to play with Mix tasks but you should use `priv/repo/seeds.exs` for this specific purpose
  # Please note that Mix tasks will not be available once the application is packaged as an OTP release for production
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





