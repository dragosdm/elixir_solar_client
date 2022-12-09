defmodule Solar.Delegates do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List delegates
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("delegates", opts)
  end

  @doc """
  Find a single delegates by its identifier
  """
  def get_by_id(id) do
    Client.get!("delegates/#{id}")
  end

  @doc """
  Find blocks produced by a specific delegate
  """
  def blocks_for_delegate(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("delegates/#{id}/blocks", opts)
  end

  @doc """
  Find missed blocks in the last 30 days by a specific delegate
  """
  def missed_blocks_by_delegate(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("delegates/#{id}/blocks/missed", opts)
  end

  @doc """
  Find wallets currently voting for a specific delegate
  """
  def voters_of_delegate(id, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("delegates/#{id}/voters", opts)
  end

  @doc """
  Get delegate public keys forging in a specific round
  """
  def rounds(id) do
    Client.get!("rounds/#{id}/delegates")
  end
end
