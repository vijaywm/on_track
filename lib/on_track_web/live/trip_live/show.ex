defmodule OnTrackWeb.TripsLive.Show do
  use OnTrackWeb, :live_view
  alias OnTrack.Trips
  alias OnTrack.Persons

  def handle_params(params, _uri, socket) do
    trip = Trips.get_trip!(34)

    %{persons: persons, meta: meta} = Persons.list_persons(params)

    socket =
      socket
      |> assign(:trip, trip)
      |> assign(:persons, persons)
      |> assign(:meta, meta)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.header>
      <%= @trip.trip_name %>: <%= @trip.origin %> to <%= @trip.destination %>, Group: <%= @trip.trip_name %>
      <:subtitle>
        <p>
          <%= Timex.format!(@trip.etd, "{WDshort}, {D} {h12}:{m} {AM}") %>
        </p>
        Some admin notes/instructions for the trip. Can be updated realtime.
      </:subtitle>
    </.header>

    <.back navigate={~p"/trips"}>Back to Trips</.back>

    <div class="mt-4">
      <Flop.Phoenix.table
        opts={OnTrackWeb.FlopConfig.table_opts()}
        items={@persons}
        meta={@meta}
        path={~p"/persons"}
      >
        <:col :let={person} label="Name" field={:full_name}><%= person.full_name %></:col>
        <:col :let={person} label="Center" field={:center}><%= person.center %></:col>
        <:col :let={person} label="Age" field={:age}><%= person.age %></:col>
        <:col :let={person} label="M/F" field={:gender}><%= person.gender %></:col>
        <:col :let={person} label="Option" field={:trip_option}><%= person.trip_option %></:col>
        <:col :let={person} label="Group" field={:trip_group}><%= person.trip_group %></:col>
        <:col :let={person} label="Status" field={:trip_status}><%= person.trip_status %></:col>
      </Flop.Phoenix.table>

      <.back navigate={~p"/trips"}>Back to Trips</.back>
    </div>
    """
  end
end
