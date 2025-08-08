// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract Auction {
    address private beneficiary = msg.sender;
    address private highestBidder;
    uint private highestBid;
    uint private endtime = block.timestamp + 1 days;

    event AuctionEnded(address winner, uint amount);
    event BidAccepted(address bidder, uint amount);

    modifier onlyOwner() {
        require(msg.sender == beneficiary, "Only the owner can perform this action");
        _;
    }

    function bid(uint amount) external payable {
        // check if auction is still on
        if (block.timestamp > endtime) {
            revert("Auction ended");
        }

        // check sender has enough funds
        require(msg.value >= amount, "Not enough funds for the bid");

        // send the money back if the bid is not higher than the current accepted bid
        if (amount <= highestBid) {
            revert("You must bid higher");
        }

        // set highest
        highestBid = amount;
        highestBidder = msg.sender;

        // emit bid accepted
        emit BidAccepted(msg.sender, amount);
    }

    function terminate() public onlyOwner {
        // transfer the funds
        payable(highestBidder).transfer(highestBid);

        // emit auction ended
        emit AuctionEnded(highestBidder, highestBid);
    }

}