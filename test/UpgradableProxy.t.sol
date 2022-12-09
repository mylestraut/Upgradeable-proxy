// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/UpgradableProxy.sol";
import "../src/BoxV1.sol";
import "../src/BoxV2.sol";

contract UgradeTest is Test {
    UpgradableProxy proxy;
    BoxV1 box;
    BoxV2 box2;

    function setUp() public {
        proxy = new UpgradableProxy();
        box = new BoxV1();
        box2 = new BoxV2();
    }
}
