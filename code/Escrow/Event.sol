// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint _balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Not approved");
        uint256 nowBalance = address(this).balance;
        beneficiary.call{value: nowBalance}("");
        emit Approved(nowBalance);
    }
}
