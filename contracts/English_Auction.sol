// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract EnglishAuction is ERC721URIStorage {
    ERC721 public myNFT;

    constructor (address _nftAddress) {
        require(msg.sender == ERC721(_nftAddress).owner(), "You're not rightful owner of this nft");
        myNFT = ERC721(_nftAddress);

        myNFT.transfer(address(this), )
    }
    
}