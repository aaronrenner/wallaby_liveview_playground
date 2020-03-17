defmodule WallabyLiveviewPlayground.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias WallabyLiveviewPlayground.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import WallabyLiveviewPlaygroundWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(WallabyLiveviewPlayground.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(WallabyLiveviewPlayground.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(WallabyLiveviewPlayground.Repo, self())

    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
