// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
  string private _name = "myOriginalToken";
  string private _symbol = "MOT";
  uint8 private _decimals = 18;

  uint rate = 20;  // 1ETH = 20MOT

  constructor () ERC20(_name, _symbol) public {
    uint value = 100;
    _mint(address(this), value);
  }

  function deposit() payable public {
    uint256 mot = msg.value * rate / (10 ** uint256(_decimals));
    require(balanceOf(address(this)) >= mot, "not enough MOT is issued");
    _transfer(address(this), msg.sender, mot);
  }

  function withdraw(uint256 value) public {
    uint256 ethValue = value * (10 ** uint256(_decimals)) / rate;
    require(ethValue <= address(this).balance, "not enough ETH in deposit");
    msg.sender.transfer(ethValue);
    _transfer(msg.sender, address(this), value);
  }

  function showContractBalance() public view returns (uint) {
    return balanceOf(address(this));
  }
}
