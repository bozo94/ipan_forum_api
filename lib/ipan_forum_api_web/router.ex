defmodule IpanForumApiWeb.Router do
  use IpanForumApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", IpanForumApiWeb do
    pipe_through :api
  end
end
