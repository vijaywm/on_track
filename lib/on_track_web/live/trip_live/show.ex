defmodule OnTrackWeb.TripsLive.Show do
  use OnTrackWeb, :live_view
  alias OnTrack.Trips

  def handle_params(%{"id" => id}, _uri, socket) do
    trip = Trips.get_trip!(id)
    socket = assign(socket, trip: trip)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.header>
      <%= @trip.trip_name %>: <%= @trip.origin %> to <%= @trip.destination %>
      <:subtitle>
        <p>
          <%= Timex.format!(@trip.etd, "{WDshort}, {D} {h12}:{m} {AM}") %>
        </p>
        Some admin notes/instructions for the trip. Can be updated realtime.
      </:subtitle>
    </.header>

    <%!-- <.list>
      <:item title="Name"><%= @trip.trip_name %></:item>
      <:item title="Origin"><%= @trip.origin %></:item>
    </.list> --%>

    <.back navigate={~p"/trips"}>Back to Trips</.back>
    """
  end
end
