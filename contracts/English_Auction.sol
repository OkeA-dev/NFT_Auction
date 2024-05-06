// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract EnglishAuction is ERC721 {
    ERC721 public myNFT;
    uint256 public nftTokenId;

    address payable public seller;
    uint256 public startingBid;
    uint256 public endTime;

    bool public started;
    bool public ended;

    address public highestBidder;
    uint256 public highestBid;

    mapping(address => uint256) public bids;

    event HighestBidIncreased(address bidder, uint256 amount);
    event AuctionEnded(address winner, uint256 amount);

    constructor(
        address _nft,
        uint256 _nftTokenId,
        uint256 _startingBid,
        uint256 _durationInSeconds
    ) {
        nft = ERC721(_nft);
        nftTokenId = _nftTokenId;
        startingBid = _startingBid;
        seller = payable(msg.sender);
        endTime = block.timestamp + _durationInSeconds;
    }

    function bid() public payable {
        require(started, "Auction has not started yet.");
        require(!ended, "Auction has ended.");
        require(msg.value > highestBid, "Bid amount is too low.");

        if(highestBidder != address(0)) {
            bid[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

        emit HighestBidIncreased(msg.sender, msg.value);
    }

    function withdraw() public {
        uint256 amount = bids[msg.sender];
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount)
    }

    function endAuction() public {
        require(block.timestamp >= endTime, "Auction has not ended yet.");
        require(!ended, "Auction has already ended.");

        ended = true;

        if (highestBidder != address(0)) {
            nft.transferFrom(seller, highestBidder, nftTokenId);
            seller.transfer(highestBid);
        } else {
            nft.transferFrom(seller, seller, nftTokenId);
        }

        emit AuctionEnded(highestBidder, highestBid);

    }

    function startAuction() public {
        require(msg.sender == seller, "Only the seller can start the auction");
        require(!started, "Auction has already started.");

        started = true;
        nft.transferFrom(msg.sender, address(this), nftTokenId);
    }

    
}