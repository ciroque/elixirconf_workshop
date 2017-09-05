defmodule ProblemC do
  @moduledoc """
  Handle timeout for an external request.
  """

  def get(timeout) do
    task = Task.async(fn -> slow_request() end)
    # only change below
    case Task.yield(task, timeout) do
      nil -> :request_timeout
      result -> result
    end
  end

  defp slow_request() do
#    HTTPoison.get("https://google.com")
    HTTPoison.get("https://bbc.com")
  end
end


// ssl.format