// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SSTestToken is ERC20 {
  //  bool private supplycontroled = false;
    constructor() ERC20("SSTest Token", "SSTest") {
         _mint(msg.sender,100000000*10 ** decimals());
      //   supplycontroled = true;
    }

    function mint() virtual external payable{
    //    require(!supplycontroled, "You can't mint anymore");
        _mint(msg.sender , msg.value);
    } 
}
