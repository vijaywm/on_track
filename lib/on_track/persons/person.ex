defmodule OnTrack.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [:full_name, :center, :trip_group],
    sortable: [:full_name, :center, :trip_group],
    default_limit: 15
  }

  schema "persons" do
    field :person_id, :string
    field :full_name, :string
    field :mobile_no, :string
    field :center, :string
    field :age, :integer
    field :gender, :string
    field :trip_option, :string
    field :trip_group, :string
    field :trip_status, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [
      :person_id,
      :full_name,
      :mobile_no,
      :center,
      :age,
      :gender,
      :trip_option,
      :trip_group,
      :trip_status
    ])
    |> validate_required([
      :person_id,
      :full_name,
      :mobile_no,
      :center,
      :age,
      :gender,
      :trip_option,
      :trip_group,
      :trip_status
    ])
  end
end
