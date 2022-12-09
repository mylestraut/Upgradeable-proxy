// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./BoxV1.sol";

contract BoxV2 is BoxV1 {
    function increment() external override {
        number += 2;
    }

    function decrement() external {
        number -= 2;
    }
}
