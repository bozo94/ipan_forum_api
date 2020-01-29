defmodule IpanForumApiWeb.Router do
  use IpanForumApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", IpanForumApiWeb do
    pipe_through :api
    scope "/v1", Api.V1, as: :v1 do
      resources "/rooms", RoomController, only: [:index, :show] do 
        resources "/themes", ThemeController, only: [:index, :show] do 
          resources "/posts", PostController, only: [:index, :show]
        end
      end
    end
  end
end
