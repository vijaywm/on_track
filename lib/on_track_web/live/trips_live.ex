defmodule OnTrackWeb.TripsLive do
  use OnTrackWeb, :live_view
  alias OnTrack.Trips

  def render(assigns) do
    ~H"""
    <Flop.Phoenix.table items={@trips} meta={@meta} path={~p"/trips"}>
      <:col :let={trip} label="Name" field={:trip_name}><%= trip.trip_name %></:col>
      <:col :let={trip} label="Origin" field={:origin}><%= trip.origin %></:col>
      <:col :let={trip} label="Destination" field={:destination}><%= trip.destination %></:col>
    </Flop.Phoenix.table>

    <Flop.Phoenix.pagination meta={@meta} path={~p"/trips"} />
    """
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, params) do
    %{trips: trips, meta: meta } = Trips.list_trips(params)
      socket
      |> assign(:trips , trips)
      |> assign(:meta , meta)
  end


end
