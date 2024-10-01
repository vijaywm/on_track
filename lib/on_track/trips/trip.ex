defmodule OnTrack.Trips.Trip do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [:trip_name, :origin], sortable: [:trip_name, :origin]
  }

  schema "trips" do
    field :status, :string
    field :origin, :string
    field :destination, :string
    field :trip_name, :string
    field :etd, :utc_datetime
    field :eta, :utc_datetime
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
    field :pax, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trip, attrs) do
    trip
    |> cast(attrs, [
      :trip_name,
      :origin,
      :destination,
      :etd,
      :eta,
      :status,
      :start_time,
      :end_time,
      :pax
    ])
    |> validate_required([
      :trip_name,
      :origin,
      :destination,
      :etd,
      :eta,
      :status,
      :start_time,
      :end_time,
      :pax
    ])
    |> unique_constraint(:trip_name)
  end
end
