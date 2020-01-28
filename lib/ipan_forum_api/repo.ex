defmodule IpanForumApi.Repo do
  use Ecto.Repo,
    otp_app: :ipan_forum_api,
    adapter: Ecto.Adapters.Postgres
end
