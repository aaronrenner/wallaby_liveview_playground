defmodule WallabyLiveviewPlayground.Integration.UserListTest do
  use WallabyLiveviewPlayground.FeatureCase, async: true
  use ExUnit.Case, async: true

  # use Wallaby.Feature

  alias WallabyLiveviewPlayground.Accounts

  test "users have names", %{session: session} do
    for name <- ["Aaron", "Mitch", "Michał"] do
      {:ok, _} = Accounts.create_user(%{name: name})
    end

    session
    |> visit("/users")
    |> find(Query.css(".user", count: 3))
    |> List.first()
    |> assert_has(Query.css(".user-name", text: "Aaron"))
  end

  test "users have names in LiveView", %{session: session} do
    for name <- ["Aaron", "Mitch", "Michał"] do
      {:ok, _} = Accounts.create_user(%{name: name})
    end

    session
    |> visit("/users_live")
    |> find(Query.css(".user", count: 3))
    |> List.first()
    |> assert_has(Query.css(".user-name", text: "Aaron"))
  end
end
