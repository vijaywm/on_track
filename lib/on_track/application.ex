defmodule OnTrack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OnTrackWeb.Telemetry,
      OnTrack.Repo,
      {DNSCluster, query: Application.get_env(:on_track, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: OnTrack.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: OnTrack.Finch},
      # Start a worker by calling: OnTrack.Worker.start_link(arg)
      # {OnTrack.Worker, arg},
      # Start to serve requests, typically the last entry
      OnTrackWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OnTrack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OnTrackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
