# Merkle Tree for NFT Whitelist (Dart)

This is based on this article: https://medium.com/@ItsCuzzo/using-merkle-trees-for-nft-whitelists-523b58ada3f9

Tutorial Javascript: https://www.youtube.com/watch?v=PekgJfLb6ak <br>
Tutorial Solidity: https://www.youtube.com/watch?v=67vkL8XkoJ0

<hr />

## Packages

[`pointycastle: ^3.6.0`](https://pub.dev/packages/pointycastle)

[`hypi_merkletree: ^2.0.2`](https://pub.dev/packages/hypi_merkletree)

## Run program (root of repo)

`dart main.dart`

Play around with this line:
`int targetAddressIndex = 1;`
to get the merkle proof of addresses from addresses list.

## Solidity Version

```json
    Pass this array in for 'bytes32[] calldata _merkleProof' to whitelistMint()

    [
        "0x702d0f86c1baf15ac2b8aae489113b59d27419b751fbf7da0ef0bae4688abc7a",
        "0xb159efe4c3ee94e91cc5740b9dbb26fc5ef48a14b53ad84d591d0eb3d65891ab"
    ]

```
