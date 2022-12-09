defmodule Solar.Http.Client do
  @url Application.compile_env(:solar, :root_uri)
  @headers [
    {"accept", "application/json"},
    {"content-type", "application/json"},
    {"user-agent", "Elixir-SXP-SDK"}
  ]

  @user_agent "solar-elixir/ " <>
                Mix.Project.config()[:version] <> " (+https://github.com/dragosdm/solar)"

  def get!(url, params \\ []) do
    url
    |> build_req_url()
    |> Req.get!(params: params)
    |> handle_response()
  rescue
    e -> handle_response(e)
  end

  def post!(url, data \\ %{}, params \\ []) do
    url
    |> build_req_url()
    |> Req.post!(json: data, params: params)
    |> handle_response()
  rescue
    e -> handle_response(e)
  end

  defp build_req_url(url) do
    Req.new(
      base_url: @url,
      headers: @headers,
      url: url,
      user_agent: @user_agent
    )
  end

  defp handle_response(%{body: body, status: status_code}) when status_code in 200..299,
    do: return_response(body["data"], body["meta"], body["errors"])

  defp handle_response(%{body: body}), do: {:error, body}

  defp return_response(data, nil, nil), do: {:ok, %{data: data}}

  defp return_response(data, meta, nil) when not is_nil(meta),
    do: {:ok, %{data: data, meta: meta}}

  defp return_response(data, nil, errors) when not is_nil(errors),
    do: {:ok, %{data: data, errors: errors}}

  defp return_response(data, meta, errors), do: {:ok, %{data: data, meta: meta, errors: errors}}
end
