defmodule ProblemA do
  @moduledoc """
  ProblemA.
  """

  @doc """
  Start Agent with map as state.
  """
  def start_link(map) when is_map(map) do
    Agent.start_link(fn() -> map end)
  end

  @doc """
  Fetch a value from the agent.
  """
  def fetch!(agent, key) do
#    Agent.get(agent, Map, :fetch!, [key])
    case fetch(agent, key) do
      {:ok, value} -> value
      {:error, exception} -> raise exception
    end
  end

  defp fetch(agent, key) do
    Agent.get(agent, fn(state) ->
      try do
        Map.fetch!(state, key)
      rescue
        exception in [KeyError] ->
          {:error, exception}
      else
        value -> {:ok, value}
      end
    end)
  end
end
