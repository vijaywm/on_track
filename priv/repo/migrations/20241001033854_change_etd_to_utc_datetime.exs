defmodule OnTrack.Repo.Migrations.ChangeEtdToUtcDatetime do
  use Ecto.Migration

  def change do
    alter table(:trips) do
      modify :etd, :utc_datetime, from: :naive_datetime
    end
  end
end
