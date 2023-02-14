// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";

contract MyERC20 is ERC20, Initializable {
    string public name;
    string public symbol;
    uint256 public initialSupply;

    function init(
        string memory _name,
        string memory _symbol,
        uint256 _supply
    ) public {
        name = _name;
        symbol = _symbol;
        initialSupply = _supply;
    }
}
