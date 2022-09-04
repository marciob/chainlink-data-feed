const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });
require("@nomiclabs/hardhat-etherscan");

async function main() {
  /*
 A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
 so contracName here is a factory for instances of our contract.
 */
  const consumerDataFeedPrices = await ethers.getContractFactory(
    "ConsumerDataFeedPrices"
  );
  // deploy the contract
  const deployedConsumerDataFeedPrices = await consumerDataFeedPrices.deploy();

  await deployedConsumerDataFeedPrices.deployed();

  // print the address of the deployed contract
  console.log("Contract Address: ", consumerDataFeedPrices.address);

  console.log("Waiting for etherscan verification.....");
  // Wait for etherscan to notice that the contract has been deployed
  await sleep(30000);

  // Verify the contract after deploying
  await hre.run("verify:verify", {
    address: deployedConsumerDataFeedPrices.address,
    constructorArguments: [],
  });
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
