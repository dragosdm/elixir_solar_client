defmodule Solar.Helper do
  def merge_params(list, defaults) do
    defaults
    |> Keyword.merge(list)
    |> Enum.filter(fn {_key, value} -> !is_nil(value) && value != "" end)
  end
end
