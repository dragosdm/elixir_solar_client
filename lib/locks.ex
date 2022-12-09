defmodule Solar.Locks do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  List HTLC transaction locks or search for locks meeting specific criteria
  """
  def get(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("locks", opts)
  end

  @doc """
  Find a single HTLC transaction lock by its ID
  """
  def locks_by_id(id) do
    Client.get!("locks/#{id}")
  end

  @doc """
  View unlocked HTLC transactions
  """
  def unlocked(data \\ %{}, opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.post!("locks/unlocked", data, opts)
  end
end
