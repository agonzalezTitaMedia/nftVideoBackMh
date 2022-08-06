async function main() {
    const NFTcontractvar = await ethers.getContractFactory("NFTcontract")
  
    // Start deployment, returning a promise that resolves to a contract object
    const nft_deploy = await NFTcontractvar.deploy()
    console.log("Contract deployed to address:", nft_deploy.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })