defmodule Solar.Wallets do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List wallets or search for wallets meeting specific criteria
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets", opts)
  end

  @doc """
  Find a single wallet by its identifier
  """
  def get_by_id(id) do
    Client.get!("wallets/#{id}")
  end

  @doc """
  List all transactions in a specific wallet
  """
  def transactions(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets/#{id}/transactions", opts)
  end

  @doc """
  List all transactions received by a specific wallet
  """
  def received(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets/#{id}/transactions/received", opts)
  end

  @doc """
  List all transactions sent by a specific wallet
  """
  def sent(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets/#{id}/transactions/sent", opts)
  end

  @doc """
  List vote or unvote transactions from a specific wallet
  """
  def votes(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets/#{id}/votes", opts)
  end

  @doc """
  List wallets in descending order of balance
  """
  def top(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("wallets/top", opts)
  end
end
