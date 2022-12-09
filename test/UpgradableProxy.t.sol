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

    function testBox() public {
        // set address of boxV1 as implementation contract
        proxy.setImplementation(address(box));
        assertEq(proxy.implementation(), address(box));

        // Cast the proxy to a BoxV1 contract
        BoxV1 initialBox = BoxV1(address(proxy));

        initialBox.increment();
        assertEq(initialBox.number(), 1);

        initialBox.increment();
        assertEq(initialBox.number(), 2);
    }

    function testBoxV2BeforeUpgrade() public {
        proxy.setImplementation(address(box));

        //Still on V1 but using V2 api
        BoxV2 upgradedBox = BoxV2(address(proxy));

        //This call will work because of shared function sigs
        upgradedBox.increment();
        assertEq(upgradedBox.number(), 1);

        //This call fails because still using boxV1
        vm.expectRevert(bytes(""));
        upgradedBox.decrement();
    }

    function testBoxV1ThenBoxV2() public {
        proxy.setImplementation(address(box));
        assertEq(proxy.implementation(), address(box));

        BoxV1 initialBox = BoxV1(address(proxy));
        initialBox.increment();
        assertEq(initialBox.number(), 1);

        proxy.setImplementation(address(box2));
        assertEq(proxy.implementation(), address(box2));

        BoxV2 upgradedBox = BoxV2(address(proxy));
        // should increment by 2
        upgradedBox.increment();
        assertEq(upgradedBox.number(), 3);

        upgradedBox.decrement();
        assertEq(upgradedBox.number(), 1);
    }
}
