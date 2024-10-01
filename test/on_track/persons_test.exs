defmodule OnTrack.PersonsTest do
  use OnTrack.DataCase

  alias OnTrack.Persons

  describe "persons" do
    alias OnTrack.Persons.Person

    import OnTrack.PersonsFixtures

    @invalid_attrs %{person_id: nil, full_name: nil, mobile_no: nil, center: nil, age: nil, gender: nil, trip_option: nil, trip_group: nil, trip_status: nil}

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Persons.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Persons.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      valid_attrs = %{person_id: "some person_id", full_name: "some full_name", mobile_no: "some mobile_no", center: "some center", age: 42, gender: "some gender", trip_option: "some trip_option", trip_group: "some trip_group", trip_status: "some trip_status"}

      assert {:ok, %Person{} = person} = Persons.create_person(valid_attrs)
      assert person.person_id == "some person_id"
      assert person.full_name == "some full_name"
      assert person.mobile_no == "some mobile_no"
      assert person.center == "some center"
      assert person.age == 42
      assert person.gender == "some gender"
      assert person.trip_option == "some trip_option"
      assert person.trip_group == "some trip_group"
      assert person.trip_status == "some trip_status"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      update_attrs = %{person_id: "some updated person_id", full_name: "some updated full_name", mobile_no: "some updated mobile_no", center: "some updated center", age: 43, gender: "some updated gender", trip_option: "some updated trip_option", trip_group: "some updated trip_group", trip_status: "some updated trip_status"}

      assert {:ok, %Person{} = person} = Persons.update_person(person, update_attrs)
      assert person.person_id == "some updated person_id"
      assert person.full_name == "some updated full_name"
      assert person.mobile_no == "some updated mobile_no"
      assert person.center == "some updated center"
      assert person.age == 43
      assert person.gender == "some updated gender"
      assert person.trip_option == "some updated trip_option"
      assert person.trip_group == "some updated trip_group"
      assert person.trip_status == "some updated trip_status"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_person(person, @invalid_attrs)
      assert person == Persons.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Persons.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Persons.change_person(person)
    end
  end
end
