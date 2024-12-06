const Municipality = artifacts.require("Municipality");

module.exports = function(deployer) {
  deployer.deploy(Municipality);
};
