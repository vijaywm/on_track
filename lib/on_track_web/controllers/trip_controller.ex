defmodule OnTrackWeb.TripController do
  use OnTrackWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :index, layout: false)
  end

  def my_trips(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :my_trips, layout: false)
  end
end
