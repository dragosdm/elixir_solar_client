defmodule Solar.Transactions do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List transactions or search for transactions meeting specific criteria
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("transactions", opts)
  end

  @doc """
  Find a single transactions by its ID
  """
  def get_by_id(id) do
    Client.get!("transactions/#{id}")
  end

  @doc """
  View unconfirmed transactions not yet in the blockchain
  """
  def unconfirmed(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("transactions/unconfirmed", opts)
  end

  @doc """
  Find a single unconfirmed transaction by its ID
  """
  def unconfirmed_by_id(id) do
    Client.get!("transactions/unconfirmed/#{id}")
  end

  @doc """
  List transaction types
  """
  def types do
    Client.get!("transactions/types")
  end

  @doc """
  List transaction fees
  """
  def fees do
    Client.get!("transactions/fees")
  end

  @doc """
  Post transactions to be included in the blockchain
  """
  def add(transactions \\ %{}) do
    Client.post!("transactions", transactions)
  end
end
