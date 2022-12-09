// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Box {
    address public implementation;

    uint256 public number;

    function increment() external {
        number++;
    }
}
