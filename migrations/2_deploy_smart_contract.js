const RNG = artifacts.require("RandomNumber");

module.exports = function (deployer) {
  deployer.deploy(RNG);
};
