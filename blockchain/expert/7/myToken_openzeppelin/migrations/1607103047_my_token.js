const MyToken = artifacts.require("myToken");
module.exports = function(_deployer) {
  const initialSupply = 100;
  _deployer.deploy(MyToken, initialSupply);
};
