defmodule OnTrack.Repo do
  use Ecto.Repo,
    otp_app: :on_track,
    adapter: Ecto.Adapters.Postgres
end
