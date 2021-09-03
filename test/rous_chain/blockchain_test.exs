defmodule RousChain.BlockchainTest do
  @moduledoc """
  This module contains test related to a blockchain
  """

  use ExUnit.Case

  alias RousChain.Blockchain
  alias RousChain.Blockchain.Block

  describe "BlockChain" do
    setup [:initialize_blockChain]

    test "should start with the genesis block", %{blockchain: blockchain} do
      assert %Block{
               data: "genesis data",
               hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
               last_hash: "-",
               timestamp: 1_599_909_623_805_627
             } == hd(blockchain.chain)
    end

    test "adds a new block", %{blockchain: blockchain} do
      data = "foo"
      blockchain = Blockchain.add_block(blockchain, data)
      [_, block] = blockchain.chain
      assert block.data == data
    end
  end

  test "validate a chain", %{blockchain: blockchain} do
    # new block into blockchain
    blockchain = Blockchain.add_block(blockchain, "0x0000-some-data-test-1-23-3-4-506-3")

    assert Blockchain.valid_chain?(blockchain)
  end

  # -----------------------------------------------

  test "data in existing chain", %{
    blockchain: blockchain
  } do
    blockchain =
      blockchain
      |> Blockchain.add_block("blockROUSS-RRRRRRRRRRROMARIO-data-block1")
      |> Blockchain.add_block("blockrouss-2")
      |> Blockchain.add_block("yee-3")

      assert Blockchain.valid_chain?(blockchain)

      index = 2
      rous_block = put_in(Enum.at(blockchain.chain, index).data, "rous data")

      blockchain = %Blockchain{chain: List.replace_at(blockchain.chain, index, rous_block)}

      # invalidade the blockchain
      refute Blockchain.valid_chain?(blockchain)
  end


  test "hash in existing chain", %{
    blockchain: blockchain
  } do
    blockchain =
      blockchain
      |> Blockchain.add_block("blockROUSS-RRRRRRRRRRROMARIO-data-block1")
      |> Blockchain.add_block("blockrouss-2")
      |> Blockchain.add_block("yee-3")

    # validate if blockchain is valid
    assert Blockchain.valid_chain?(blockchain)
    # temper the blockchain, assume at location 2
    index = 2
    rous_block = put_in(Enum.at(blockchain.chain, index).hash, "rous hash")

    blockchain = %Blockchain{chain: List.replace_at(blockchain.chain, index, rous_block)}

    # should invalidate the blockchain
    refute Blockchain.valid_chain?(blockchain)
  end


  defp initialize_blockChain(context), do: Map.put(context, :blockchain, Blockchain.new())
end
