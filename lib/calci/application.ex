defmodule Calci.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Calci.Worker.start_link(arg)
      # {Calci.Worker, arg}
      {Calci.Calculator, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Calci.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
