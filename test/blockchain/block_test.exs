defmodule RousChain.BlockChain.BlockTest do
  @doc """
  Module for test
  """

  use ExUnit.Case
  alias RousChain.BlockChain.Block

  describe "block" do
    test "genesis alive" do
      assert %Block{
               data: "genesis-data",
               hash: "genesis-hash",# the genesis block doesn't have a last hash
               last_hash: "-",
               timestamp: "1_599_909_623_805_627" # random timestamp
             } == Block.genesis()
    end

    test "mine block will returns a new block" do
      %Block{hash: hash} = genesis_block = Block.genesis()

      assert %Block{
        data: "mined data",
        last_hash: ^hash
      } = Block.mine_block(genesis_block, "mined data")
    end


    test "new block when pass the parameters" do
      timestamp = DateTime.utc_now() |> DateTime.to_unix(1_000_000)
      data = "new block data"
      last_hash = "random_hash_last_block"

      assert %Block{timestamp: ^timestamp, hash: hash, last_hash: ^last_hash, data: ^data} =
               Block.new(timestamp, hash, last_hash, data)
    end
  end
end
