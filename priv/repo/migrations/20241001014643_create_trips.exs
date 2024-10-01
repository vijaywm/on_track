defmodule OnTrack.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :trip_name, :string
      add :origin, :string
      add :destination, :string
      add :etd, :naive_datetime
      add :eta, :utc_datetime
      add :status, :string
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :pax, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:trips, [:trip_name])
  end
end
