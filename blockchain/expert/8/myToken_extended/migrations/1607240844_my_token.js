const MyToken = artifacts.require("myToken");
module.exports = function(_deployer) {
  _deployer.deploy(MyToken);
};
