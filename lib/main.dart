import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:hypi_merkletree/hypi_merkletree.dart';
import 'package:pointycastle/pointycastle.dart';

void main() {
  Uint8List keccak256(Uint8List data) {
    var keccak256 = Digest('Keccak/256');
    return keccak256.process(data);
  }

  // print(hex.encode(keccak256(Uint8List.fromList(utf8.encode('0x5B38Da6a701c568545dCfcB03FcB875f56beddC4')))));
  var addresses = [
    '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4',
    '0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2',
    '0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db',
    '0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB',
    '0x617F2E2fD72FD9D5503197092aC168c91465E7f2',
  ];
  var leaves = addresses
      .map((x) => Uint8List.fromList(utf8.encode(x)))
      .map((x) => keccak256(x))
      .toList();
  //for (var leaf in leaves) {
  //  print(hex.encode(leaf));
  //}
  var tree = MerkleTree(leaves: leaves, hashAlgo: keccak256);
  print("Merkle Root: \n" + hex.encode(tree.root));
  int targetAddressIndex = 1;
  var merkleProofList = tree.getProof(
      leaf: Uint8List.fromList(utf8.encode(hex.encode(tree.root))),
      index: targetAddressIndex);
  var targetMerkleProof =
      merkleProofList.map((e) => "\"" + hex.encode(e.data) + "\"").toList();
  print("MerkleProof for " +
      addresses[targetAddressIndex] +
      ": \n" +
      targetMerkleProof.toString());
}
