# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OnTrack.Repo.insert!(%OnTrack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias OnTrack.Repo
alias OnTrack.Trips.Trip
alias OnTrack.Persons.Person

Faker.start()

# Helper function to generate a UTC datetime
random_utc_datetime = fn ->
  Faker.DateTime.between(~N[2025-02-01 00:00:00], ~N[2025-02-10 00:00:00])
  |> DateTime.from_naive!("Etc/UTC")
  |> DateTime.truncate(:second)
end

# Generate 10 trip records
trips =
  for _ <- 1..100 do
    %Trip{
      status: Enum.random(["Running", "Completed", "Cancelled"]),
      origin: Enum.random(["Adalaj", "Surat", "Rajkot"]),
      destination: Enum.random(["Jaipur", "Udaipur"]),
      trip_name: System.unique_integer([:positive]) |> Integer.to_string(),
      etd: random_utc_datetime.(),
      eta: random_utc_datetime.(),
      start_time: random_utc_datetime.(),
      end_time: random_utc_datetime.(),
      pax: Enum.random(48..55)
    }
  end

Repo.query!("TRUNCATE TABLE trips RESTART IDENTITY CASCADE")

# Insert the generated records into the database
Enum.each(trips, fn trip ->
  Repo.insert!(trip)
end)

Repo.query!("TRUNCATE TABLE persons RESTART IDENTITY CASCADE")

persons =
  for _ <- 1..100 do
    %Person{
      person_id: System.unique_integer([:positive]) |> Integer.to_string(),
      full_name: Faker.Person.name(),
      mobile_no: Faker.Phone.EnUs.phone(),
      center: Faker.Address.city(),
      age: Enum.random(18..60),
      gender: Enum.random(["M", "F"]),
      trip_option: Enum.random(["Basic", "Premium", "VIP"]),
      trip_group: Enum.random(["Group A", "Group B", "Group C"]),
      trip_status: Enum.random(["On Board", "Off Board", "Transfer"])
    }
  end

Enum.each(persons, fn person ->
  Repo.insert!(person)
end)
