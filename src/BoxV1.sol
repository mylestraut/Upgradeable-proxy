// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract BoxV1 {
    address public implementation;

    uint256 public number;

    function increment() external virtual {
        number++;
    }
}
