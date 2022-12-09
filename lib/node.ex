defmodule Solar.Node do
  alias Solar.Helper
  alias Solar.Http.Client

  @defaults [page: 1, limit: 100]

  @doc """
  Get node configuration information
  """
  def configuration do
    Client.get!("node/configuration")
  end

  @doc """
  Get node crypto configuration information
  """
  def crypto do
    Client.get!("node/configuration/crypto")
  end

  @doc """
  Get node fee statistics
  """
  def fees do
    Client.get!("node/fees")
  end

  @doc """
  Get node status information
  """
  def status do
    Client.get!("node/status")
  end

  @doc """
  Get node sync status information
  """
  def syncing do
    Client.get!("node/syncing")
  end

  @doc """
  See node peer status information
  """
  def peers(opts \\ []) do
    opts = Helper.merge_params(opts, @defaults)

    Client.get!("peers", opts)
  end

  @doc """
  Find a single peer by its IP address
  """
  def peers_by_ip(ip) do
    Client.get!("peers/#{ip}")
  end
end
