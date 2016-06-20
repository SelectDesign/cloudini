defmodule Cloudini.Metrics do
  defmacro with_metrics(action, do: do_clause) do
    action_spiral = "cloudini.req.#{action}"
    fail_spiral = "cloudini.req.#{action}.failure"
    action_timed = "cloudini.req.#{action}.time"

    quote do
      action_fn = fn ->
        unquote(do_clause)
      end

      timer = :quintana.begin_timed unquote(action_timed)
      result = action_fn.()
      :ok = :quintana.notify_timed timer
      :ok = :quintana.notify_spiral unquote(action_spiral), 1

      case result do
        {:error, _} ->
          :ok = :quintana.notify_spiral unquote(fail_spiral), 1
          result
        _ ->
          result
      end
    end
  end
end
