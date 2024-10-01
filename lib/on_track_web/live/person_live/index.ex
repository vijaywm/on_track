defmodule OnTrackWeb.PersonsLive.Index do
  use OnTrackWeb, :live_view
  alias OnTrack.Persons

  def render(assigns) do
    ~H"""
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

    <Flop.Phoenix.pagination
      opts={OnTrackWeb.FlopConfig.pagination_opts()}
      meta={@meta}
      path={~p"/persons"}
    />
    """
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, params) do
    %{persons: persons, meta: meta} = Persons.list_persons(params)

    socket
    |> assign(:persons, persons)
    |> assign(:meta, meta)
  end
end
