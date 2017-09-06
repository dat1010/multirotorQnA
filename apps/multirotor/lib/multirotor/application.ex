defmodule Multirotor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    #Ask Adi if ne knows anything about this change.
    import Supervisor.Spec
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Multirotor.Worker.start_link(arg)
      # {Multirotor.Worker, arg},
      Multirotor.Repo,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Multirotor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
