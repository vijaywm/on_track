defmodule OnTrack.Sheets do
  alias Goth.Token
  alias GoogleApi.Sheets.V4.Api.Spreadsheets
  alias GoogleApi.Sheets.V4.Connection

  @scope "https://www.googleapis.com/auth/spreadsheets"

  alias OnTrack.Repo
  alias OnTrack.Persons.Person
  alias OnTrack.Trips.Trip

  # "01-02-2025 20:30"
  @datetime_format "{0D}-{0M}-{YYYY} {h24}:{m}"

  defp to_utc(datetime_str) do
    Timex.parse!(datetime_str, @datetime_format) |> DateTime.from_naive!("Etc/UTC")
  end

  def get_spreadsheet_id do
    Application.get_env(:on_track, :spreadsheet_id)
  end

  def person_from_list([
        person_id,
        full_name,
        mobile_no,
        center,
        _age_str,
        gender_str,
        trip_option,
        trip_group,
        trip_status
      ]) do
    %Person{
      person_id: person_id,
      full_name: full_name,
      mobile_no: mobile_no,
      center: center,
      # String.to_integer(age_str),
      age: 12,
      gender: gender_str,
      trip_option: trip_option,
      trip_group: trip_group,
      trip_status: trip_status
    }
  end

  defp trip_from_list([
         trip_name,
         trip_date,
         trip_group,
         origin,
         destination,
         etd,
         eta,
         start_time,
         end_time,
         status,
         capacity,
         pax
       ]) do
    %Trip{
      trip_name: trip_name,
      trip_date: Date.from_iso8601!(trip_date),
      trip_group: trip_group,
      origin: origin,
      destination: destination,
      etd: to_utc(etd),
      eta: to_utc(eta),
      # start_time: to_utc(start_time),
      # end_time: to_utc(end_time),
      status: status,
      capacity: String.to_integer(capacity),
      pax: String.to_integer(pax)
    }
  end

  def sync(sheet_name) do
    IO.puts("syncing " <> sheet_name)

    {:ok, token} = Goth.Token.for_scope(@scope)
    conn = Connection.new(token.token)

    {:ok, response} =
      Spreadsheets.sheets_spreadsheets_values_get(conn, get_spreadsheet_id(), sheet_name)

    insert_rows(sheet_name, response.values)

    {:ok, "Sync #{sheet_name} finished"}
  end

  defp insert_rows("Person Master", arr) do
    Repo.query("TRUNCATE TABLE persons RESTART IDENTITY CASCADE")

    arr
    |> Enum.drop(1)
    |> Enum.each(fn d ->
      doc = person_from_list(d)
      Repo.insert!(doc)
    end)
  end

  defp insert_rows("Trip Master", arr) do
    Repo.query("TRUNCATE TABLE trips RESTART IDENTITY CASCADE")

    arr
    |> Enum.drop(1)
    |> Enum.each(fn d ->
      doc = trip_from_list(d)
      IO.inspect(doc)
      Repo.insert!(doc)
    end)
  end
end
