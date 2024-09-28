defmodule OnTrackWeb.TripHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use OnTrackWeb, :html

  embed_templates "trip_html/*"
end
