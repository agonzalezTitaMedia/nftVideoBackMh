const { expect } = require("chai");

describe("MyNftCollec", function () {
  it("Should return the right name and symbol", async function () {
    const MyNftCollec = await hre.ethers.getContractFactory("NFTcontract");
    const myNftCollec = await MyNftCollec.deploy("TitaNft", "TMN");

    await myNftCollec.deployed();
    expect(await myNftCollec.name()).to.equal("TitaNft");
    expect(await myNftCollec.symbol()).to.equal("TMN");
  });
});