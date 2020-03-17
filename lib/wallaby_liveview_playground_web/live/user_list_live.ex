defmodule WallabyLiveviewPlaygroundWeb.UserListLive do
  use Phoenix.LiveView

  alias WallabyLiveviewPlayground.Accounts

  alias WallabyLiveviewPlaygroundWeb.UserListView

  def render(assigns) do
    Phoenix.View.render(UserListView, "list.html", assigns)
  end

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "UserListLive PID")
    users = Accounts.list_users()
    {:ok, assign(socket, :users, users)}
  end
end
