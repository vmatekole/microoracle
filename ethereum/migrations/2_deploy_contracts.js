var EternalStorage = artifacts.require("./database/EternalStorage.sol");

module.exports = function(deployer) {
  deployer.deploy(EternalStorage);
};
