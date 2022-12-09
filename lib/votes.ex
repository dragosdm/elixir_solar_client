defmodule Solar.Votes do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List votes or search for votes meeting specific criteria
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("votes", opts)
  end

  @doc """
  Find a single vote by its transaction ID
  """
  def get_by_transaction_id(id) do
    Client.get!("votes/#{id}")
  end
end
