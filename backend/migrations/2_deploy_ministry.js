const Ministry = artifacts.require("Ministry");

module.exports = function(deployer) {
  deployer.deploy(Ministry);
};
