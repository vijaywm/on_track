defmodule OnTrack.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :trip_name, :string
      add :trip_date, :date
      add :trip_group, :string
      add :origin, :string
      add :destination, :string
      add :etd, :utc_datetime
      add :eta, :utc_datetime
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :status, :string
      add :pax, :integer
      add :capacity, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
