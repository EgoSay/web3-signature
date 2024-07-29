// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC20 is ERC20, Ownable(msg.sender) {

    uint256 public totalSupplyLimit;
    uint256 public perMint;
    uint256 public mintedSupply;

    constructor(string memory symbol_, uint256 totalSupply_, uint256 _perMint) ERC20(symbol_, symbol_) {
        totalSupplyLimit = totalSupply_;
        perMint = _perMint;
    }

    function initialize(string memory symbol_, uint256 totalSupply_, uint256 _perMint) public {
        totalSupplyLimit = totalSupply_;
        perMint = _perMint;
    }

    function mint(address to) public onlyOwner {
        require(mintedSupply + perMint <= totalSupplyLimit, "Exceeds total supply");
        _mint(to, perMint);
        mintedSupply += perMint;
    }
}