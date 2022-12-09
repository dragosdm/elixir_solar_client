defmodule Solar.Blockchain do
  alias Solar.Http.Client

  @doc """
  Get general block information
  """
  def get do
    Client.get!("blockchain")
  end

  @doc """
  Search the blockchain
  """
  def search(id) do
    Client.get!("blockchain/search/#{id}")
  end
end
