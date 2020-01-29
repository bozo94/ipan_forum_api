defmodule IpanForumApiWeb.Api.V1.ThemeView do 
  use IpanForumApiWeb, :view

  def render("index.json", %{themes: themes}) do
    %{data: render_many(themes, IpanForumApiWeb.Api.V1.ThemeView, "theme.json")}
  end

  def render("show.json", %{theme: theme, room: room, posts: posts}) do
    %{theme: render_one(theme, IpanForumApiWeb.Api.V1.ThemeView, "theme.json"),
      posts: render_many(posts, IpanForumApiWeb.Api.V1.PostView, "post.json")    
  }
  end

  def render("theme.json", %{theme: theme}) do
    %{
      id: theme.id,
      title: theme.name,
    }
  end
end