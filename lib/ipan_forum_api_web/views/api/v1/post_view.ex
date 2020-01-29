defmodule IpanForumApiWeb.Api.V1.PostView do 
  use IpanForumApiWeb, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, IpanForumApiWeb.Api.V1.PostView, "post.json")}
  end

  def render("show.json", %{theme: theme, room: room, post: post}) do
    %{post: render_one(post, IpanForumApiWeb.Api.V1.PostView, "post.json"),
  }
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.name,
      body: post.body
    }
  end
end