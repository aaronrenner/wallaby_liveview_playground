defmodule WallabyLiveviewPlayground.Repo do
  use Ecto.Repo,
    otp_app: :wallaby_liveview_playground,
    adapter: Ecto.Adapters.Postgres
end
