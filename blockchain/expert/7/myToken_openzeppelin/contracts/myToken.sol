// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
  string private _name = "myOriginalToken";
  string private _symbol = "MOT";
  uint8 private _decimals = 18;

  address account = msg.sender;

  constructor () ERC20(_name, _symbol) public {
    uint value = 100 * 10 ** uint256(_decimals);
    _mint(account, value);
  }
}
