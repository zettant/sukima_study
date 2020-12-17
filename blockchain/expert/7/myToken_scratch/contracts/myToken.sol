// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract myToken {
  string public name;
  string public symbol;
  uint256 public totalSupply;
  uint8 public decimals = 18;

  mapping (address => uint) public  balances;
  mapping (address => mapping (address => uint))public  allowed;
  event Transfer(address indexed _from, address indexed _to, uint _value);
  event Approval(address indexed _owner, address indexed _spender, uint _value);

  constructor(uint _initial, string memory _name, string memory _symbol) public {
      totalSupply = _initial * 10 ** uint256(decimals);
      balances[msg.sender] = totalSupply;
      name = _name;
      symbol = _symbol;
  }

  function balanceOf(address _address) public view returns(uint balance){
      return balances[_address];
  }

  function transfer(address _to, uint _value) public returns (bool success) {
      if (balances[msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
          balances[msg.sender] -= _value;
          balances[_to] += _value;
          emit Transfer(msg.sender, _to, _value);
          return true;
      }
      return false;
  }

  function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
      if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
          balances[_from] -= _value;
          allowed[_from][msg.sender] -= _value;
          balances[_to] += _value;
          emit Transfer(_from, _to, _value);
          return true;
      }
      return false;
  }

  function approve(address _spender, uint _value) public returns (bool success) {
      allowed[msg.sender][_spender] = _value;
      emit Approval(msg.sender, _spender, _value);
      return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint remaining) {
      return allowed[_owner][_spender];
  }
}
