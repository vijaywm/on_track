defmodule OnTrack.Sheets do
  alias Goth.Token
  alias GoogleApi.Sheets.V4.Api.Spreadsheets
  alias GoogleApi.Sheets.V4.Connection

  @scope "https://www.googleapis.com/auth/spreadsheets"

  alias OnTrack.Repo
  alias OnTrack.Persons.Person

  def get_spreadsheet_id do
    Application.get_env(:on_track, :spreadsheet_id)
  end

  def from_list([
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

  def sync() do
    IO.puts("syncing...")

    {:ok, token} = Goth.Token.for_scope(@scope)
    conn = Connection.new(token.token)

    {:ok, response} =
      Spreadsheets.sheets_spreadsheets_values_get(conn, get_spreadsheet_id(), "Person Master")

    response.values
    |> Enum.drop(1)
    |> Enum.each(fn d ->
      person = from_list(d)
      Repo.insert!(person)
    end)
  end
end
