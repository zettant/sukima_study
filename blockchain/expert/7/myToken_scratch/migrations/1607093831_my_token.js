const MyToken = artifacts.require("myToken");

module.exports = function(_deployer) {
  const initialSupply = 100;
  const name = "myOriginalToken";
  const symbol = "MOT";
  _deployer.deploy(MyToken, initialSupply, name, symbol);
};
