defmodule OnTrack.PersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnTrack.Persons` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        age: 42,
        center: "some center",
        full_name: "some full_name",
        gender: "some gender",
        mobile_no: "some mobile_no",
        person_id: "some person_id",
        trip_group: "some trip_group",
        trip_option: "some trip_option",
        trip_status: "some trip_status"
      })
      |> OnTrack.Persons.create_person()

    person
  end
end
