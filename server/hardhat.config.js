require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  paths: {
    artifacts: "./artifacts",
  },
  solidity: "0.8.17",
  networks: {
    hardhat: {
      chainId: 31337
    }
  },
};
