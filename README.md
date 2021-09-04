# RousChain

First of all 
* Install dependencies with `mix deps.get`
* Open your iex `iex -S mix`



``alias`` allows you to set up aliases for any given module name (RousChain.Blockchain)


```elixir
iex(1)> alias RousChain.Blockchain
RousChain.Blockchain
```

Every block in a blockchain stores a reference to the previous block. In the case of Genesis Block there is no hash of previous block for reference.

```elixir
iex(2)> blockchain = Blockchain.new()
%RousChain.Blockchain{
  chain: [
    %RousChain.Blockchain.Block{
      data: "genesis data",
      hash: "0155B5E9617723ECC7E56E945F7FFFB151FD66001D13EB0E85C1CE962CBCC9B3",
      last_hash: "-",
      timestamp: 978310861000
    }
  ]
}
```

Let's add a new block:


```elixir
iex(3)> blockchain = Blockchain.add_block(blockchain, "first block data :c")
%RousChain.Blockchain{
  chain: [
    %RousChain.Blockchain.Block{
      data: "genesis data",
      hash: "0155B5E9617723ECC7E56E945F7FFFB151FD66001D13EB0E85C1CE962CBCC9B3",
      last_hash: "-",
      timestamp: 978310861000
    },
    %RousChain.Blockchain.Block{
      data: "first block data :c",
      hash: "381D3C24EC147051622AE653E18F98F6B1D157CBB8380C184D3CA08A303B4D87",
      last_hash: "0155B5E9617723ECC7E56E945F7FFFB151FD66001D13EB0E85C1CE962CBCC9B3",
      timestamp: 1630633127266000
    }
  ]
}
```


As you can see, this block now has a previous hash.

Second block data:


```elixir
iex(4)> blockchain = Blockchain.add_block(blockchain, "second block data :c") 
%RousChain.Blockchain{
  chain: [
    %RousChain.Blockchain.Block{
      data: "genesis data",
      hash: "0155B5E9617723ECC7E56E945F7FFFB151FD66001D13EB0E85C1CE962CBCC9B3",
      last_hash: "-",
      timestamp: 978310861000
    },
    %RousChain.Blockchain.Block{
      data: "first block data :c",
      hash: "381D3C24EC147051622AE653E18F98F6B1D157CBB8380C184D3CA08A303B4D87",
      last_hash: "0155B5E9617723ECC7E56E945F7FFFB151FD66001D13EB0E85C1CE962CBCC9B3",
      timestamp: 1630633127266000
    },
    %RousChain.Blockchain.Block{
      data: "second block data :c",
      hash: "40FB1326A7B0ACF53A05DDFA18C739AD3485ABC8FD8671ED082D280C761C2B76",
      last_hash: "381D3C24EC147051622AE653E18F98F6B1D157CBB8380C184D3CA08A303B4D87",
      timestamp: 1630633155038000
    }
  ]
}
```

This was an example of how to make the principles of blockchain using Elixir.

