defmodule Multidatabase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Multidatabase.Repo,
      Multidatabase.RepoTwo,
      Multidatabase.RepoThree,
      # Start the Telemetry supervisor
      MultidatabaseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Multidatabase.PubSub},
      # Start the Endpoint (http/https)
      MultidatabaseWeb.Endpoint
      # Start a worker by calling: Multidatabase.Worker.start_link(arg)
      # {Multidatabase.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Multidatabase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MultidatabaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
