defmodule OnTrack.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :person_id, :string
      add :full_name, :string
      add :mobile_no, :string
      add :center, :string
      add :age, :integer
      add :gender, :string
      add :trip_option, :string
      add :trip_group, :string
      add :trip_status, :string

      timestamps(type: :utc_datetime)
    end
  end
end
