defmodule Berries.Repo do
  use Ecto.Repo,
    otp_app: :berries,
    adapter: Ecto.Adapters.SQLite3
end
