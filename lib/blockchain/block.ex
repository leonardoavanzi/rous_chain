defmodule RousChain.BlockChain.Block do
  @moduledoc """
  This module is the single block struct in a basic blockchain.
  """
  alias __MODULE__ #__module RousChain


  @type t :: %Block{
          timestamp: pos_integer(),
          last_hash: String.t(),
          hash: String.t(),
          data: any()
        }

        defstruct ~w(timestamp last_hash hash data)a # ~w ("timestamp", "last_hash", "hash", "data")
end
