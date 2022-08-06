// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFTcontract is ERC721 {
    uint256 public MAX_TOKEN = 10;
    uint256 public PRICE = 0.001 ether;
    address public CREATOR = 0x7F9691fAa9D935b5B55e3ac4E3399161e7ab37F6;
    uint256 public token_count;

    constructor() ERC721("TitaNft", "TMN") {}

    function _baseURI() internal view virtual override returns (string memory) {
        return "https://raw.githubusercontent.com/agonzalezTitaMedia/collection04/main/";
    }

    function mintNFT(address to) public payable
    {
        require(token_count < MAX_TOKEN, "Sold out");
        require(msg.value >= PRICE, "Must pay price");
        _mint(to, token_count);
        token_count  += 1;
    }

    function withdrawAll() public
    {
        (bool success, ) = CREATOR.call{value:address(this).balance}("");
        require(success, "Transfer failed.");
    }
}