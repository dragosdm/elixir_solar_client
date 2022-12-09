defmodule Solar.Blocks do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List blocks
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("blocks", opts)
  end

  @doc """
  Find a single block by its ID or height
  """
  def get_by_id_or_height(block) do
    Client.get!("blocks/#{block}")
  end

  @doc """
  Find missed blocks in the last 30 days
  """
  def missed(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("blocks/missed", opts)
  end

  @doc """
  Get the first block in the blockchain
  """
  def first do
    Client.get!("blocks/first")
  end

  @doc """
  Get the most recent block in the blockchain
  """
  def last do
    Client.get!("blocks/last")
  end

  @doc """
  Find transactions in a specific block
  """
  def transactions(block) do
    Client.get!("blocks/#{block}/transactions")
  end
end
