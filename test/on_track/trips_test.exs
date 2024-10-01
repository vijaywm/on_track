defmodule OnTrack.TripsTest do
  use OnTrack.DataCase

  alias OnTrack.Trips

  describe "trips" do
    alias OnTrack.Trips.Trip

    import OnTrack.TripsFixtures

    @invalid_attrs %{status: nil, origin: nil, destination: nil, trip_name: nil, etd: nil, eta: nil, start_time: nil, end_time: nil, pax: nil}

    test "list_trips/0 returns all trips" do
      trip = trip_fixture()
      assert Trips.list_trips() == [trip]
    end

    test "get_trip!/1 returns the trip with given id" do
      trip = trip_fixture()
      assert Trips.get_trip!(trip.id) == trip
    end

    test "create_trip/1 with valid data creates a trip" do
      valid_attrs = %{status: "some status", origin: "some origin", destination: "some destination", trip_name: "some trip_name", etd: ~N[2024-09-30 01:46:00], eta: ~U[2024-09-30 01:46:00Z], start_time: ~U[2024-09-30 01:46:00Z], end_time: ~U[2024-09-30 01:46:00Z], pax: 42}

      assert {:ok, %Trip{} = trip} = Trips.create_trip(valid_attrs)
      assert trip.status == "some status"
      assert trip.origin == "some origin"
      assert trip.destination == "some destination"
      assert trip.trip_name == "some trip_name"
      assert trip.etd == ~N[2024-09-30 01:46:00]
      assert trip.eta == ~U[2024-09-30 01:46:00Z]
      assert trip.start_time == ~U[2024-09-30 01:46:00Z]
      assert trip.end_time == ~U[2024-09-30 01:46:00Z]
      assert trip.pax == 42
    end

    test "create_trip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trips.create_trip(@invalid_attrs)
    end

    test "update_trip/2 with valid data updates the trip" do
      trip = trip_fixture()
      update_attrs = %{status: "some updated status", origin: "some updated origin", destination: "some updated destination", trip_name: "some updated trip_name", etd: ~N[2024-10-01 01:46:00], eta: ~U[2024-10-01 01:46:00Z], start_time: ~U[2024-10-01 01:46:00Z], end_time: ~U[2024-10-01 01:46:00Z], pax: 43}

      assert {:ok, %Trip{} = trip} = Trips.update_trip(trip, update_attrs)
      assert trip.status == "some updated status"
      assert trip.origin == "some updated origin"
      assert trip.destination == "some updated destination"
      assert trip.trip_name == "some updated trip_name"
      assert trip.etd == ~N[2024-10-01 01:46:00]
      assert trip.eta == ~U[2024-10-01 01:46:00Z]
      assert trip.start_time == ~U[2024-10-01 01:46:00Z]
      assert trip.end_time == ~U[2024-10-01 01:46:00Z]
      assert trip.pax == 43
    end

    test "update_trip/2 with invalid data returns error changeset" do
      trip = trip_fixture()
      assert {:error, %Ecto.Changeset{}} = Trips.update_trip(trip, @invalid_attrs)
      assert trip == Trips.get_trip!(trip.id)
    end

    test "delete_trip/1 deletes the trip" do
      trip = trip_fixture()
      assert {:ok, %Trip{}} = Trips.delete_trip(trip)
      assert_raise Ecto.NoResultsError, fn -> Trips.get_trip!(trip.id) end
    end

    test "change_trip/1 returns a trip changeset" do
      trip = trip_fixture()
      assert %Ecto.Changeset{} = Trips.change_trip(trip)
    end
  end
end
