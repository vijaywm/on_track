defmodule OnTrack.TripsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnTrack.Trips` context.
  """

  @doc """
  Generate a unique trip trip_name.
  """
  def unique_trip_trip_name, do: "some trip_name#{System.unique_integer([:positive])}"

  @doc """
  Generate a trip.
  """
  def trip_fixture(attrs \\ %{}) do
    {:ok, trip} =
      attrs
      |> Enum.into(%{
        destination: "some destination",
        end_time: ~U[2024-09-30 01:46:00Z],
        eta: ~U[2024-09-30 01:46:00Z],
        etd: ~N[2024-09-30 01:46:00],
        origin: "some origin",
        pax: 42,
        start_time: ~U[2024-09-30 01:46:00Z],
        status: "some status",
        trip_name: unique_trip_trip_name()
      })
      |> OnTrack.Trips.create_trip()

    trip
  end
end
