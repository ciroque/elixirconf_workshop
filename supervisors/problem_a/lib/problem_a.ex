defmodule ProblemA do
  @moduledoc """
  ProblemA.
  """


  defmodule ChildTask do
    use Task, restart: :transient

    defdelegate start_link(fun), to: Task
  end

  @doc """
  Start a task that is run again if it crashes
  """
  def start_link(fun) do
#    Task.start_link(fun)

    Supervisor.start_link([{ChildTask, fun}], [strategy: :one_for_one, max_restarts: 1] )
  end
end
