defmodule MultidatabaseWeb.CommentLive.Index do
  use MultidatabaseWeb, :live_view

  alias Multidatabase.Blog
  alias Multidatabase.Blog.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :comments, list_comments())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Comment")
    |> assign(:comment, Blog.get_comment!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Comment")
    |> assign(:comment, %Comment{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Comments")
    |> assign(:comment, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    comment = Blog.get_comment!(id)
    {:ok, _} = Blog.delete_comment(comment)

    {:noreply, assign(socket, :comments, list_comments())}
  end

  defp list_comments do
    Blog.list_comments()
  end
end
