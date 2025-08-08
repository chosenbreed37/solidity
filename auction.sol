// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Auction {
    address payable private beneficiary;
    uint256 private auctionEndtime;
    address private highestBidder;
    uint256 private highestBid;
    bool ended = false;

    mapping(address => uint256) lowerBids;

    event BidIncreased(address bidder, uint256 amount);

    event AuctionEnded(address winner, uint256 amount);

    constructor(address payable _beneficiary, uint256 auctionDuration) {
        beneficiary = _beneficiary;
        auctionEndtime = block.timestamp + auctionDuration;
    }

    function bid() external payable {
        if (block.timestamp > auctionEndtime) {
            revert("Auction ended!");
        }

        address bidder = msg.sender;
        uint256 amount = msg.value;

        if (amount > highestBid) {
            highestBid = amount;
            highestBidder = bidder;
            emit BidIncreased(bidder, amount);
        } else {
            lowerBids[bidder] += amount;
        }
    }

    function withdraw() external {
        address bidder = msg.sender;
        uint256 amount = lowerBids[bidder];
        if (amount > 0) {
            lowerBids[bidder] = 0;
            if (!payable(bidder).send(amount)) {
                lowerBids[bidder] = amount;
            }
        }
    }

    modifier onlyOwner() {
        require(
            msg.sender == beneficiary,
            "Only the auctioneer can terminate the auction"
        );
        _;
    }

    function endAuction() external onlyOwner {
        require(block.timestamp < auctionEndtime, "Auction still in progress");
        require(!ended, "Auction already ended");
        payable(beneficiary).transfer(highestBid);
        emit AuctionEnded(highestBidder, highestBid);
        ended = true;
    }
}
