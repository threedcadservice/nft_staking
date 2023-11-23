// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './stake.sol';

contract CustomOwnable
{
	address public owner;

	event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

	constructor(address _owner)
	{
		require (_owner != address(0));
		owner = _owner;
	}

	modifier onlyOwner()
	{
		require(msg.sender == owner);
		_;
	}

	function transferOwnership(address newOwner) public onlyOwner
	{
		require(newOwner != address(0));
		emit OwnershipTransferred(owner, newOwner);
		owner = newOwner;
	}
}

contract Royalty is CustomOwnable
{
    address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    _recipientsInfo private _recip;
    _stakeFundsInfo private _stakeFund;

    struct _recipientsInfo {
        address[] recipientsAddress;
        uint8[] fundRate;
    }

    struct _stakeFundsInfo {
        address poolAddress;
        uint8 fundRate;
    }

	constructor(address _admin) CustomOwnable(_admin)
	{
		
	}

    receive() external payable {}
	
    function withdrawEth(address payable to, uint256 amount) onlyOwner external {
        to.transfer(amount);
    }

    function withdrawUSDC(address to, uint256 amount) onlyOwner external {
        IERC20(USDC).transfer(to, amount);
    }

    function getBalanceEth() external view returns(uint256) {
        return address(this).balance;
    }

    function getBalanceUSDC() external view returns(uint256) {
        return IERC20(USDC).balanceOf(address(this));
    }

    function setRecipients(address[] memory recipients, uint8[] memory fundRate) onlyOwner external {
        require(recipients.length == fundRate.length, "recipient'length must be same as fundRate's length.");

        uint8 rateSum = 0;
        for(uint i=0; i<fundRate.length; i++){
            rateSum = rateSum + fundRate[i];
        }
        rateSum = rateSum + _stakeFund.fundRate;
        require(rateSum <= 100, "distirubte percent can't exceed 100.");

        for(uint i=0; i<recipients.length; i++){
            _recip.recipientsAddress.push(recipients[i]);
            _recip.fundRate.push(fundRate[i]);
        }
    }

    function setStakeFund(address pool, uint8 fundRate) onlyOwner external {
        uint8 rateSum = 0;
        for(uint i=0; i<_recip.fundRate.length; i++){
            rateSum = rateSum + _recip.fundRate[i];
        }
        rateSum = rateSum + fundRate;
        require(rateSum <= 100, "distirubte percent can't exceed 100.");

        _stakeFund.poolAddress = pool;
        _stakeFund.fundRate = fundRate;
    }

    function getRecipients() external view returns(address[] memory) {
        return _recip.recipientsAddress;
    }

    function getRecipFunds() external view returns(uint8[] memory) {
        return _recip.fundRate;
    }

    function getStakePool() external view returns(address) {
        return _stakeFund.poolAddress;
    }

    function getStakeFundRate() external view returns(uint8) {
        return _stakeFund.fundRate;
    }

    function distributeEth() onlyOwner external {
        uint256 _balance = address(this).balance;
        uint256 tempAmount = 0;
        for(uint i=0; i<_recip.recipientsAddress.length; i++) {
            tempAmount = _balance * _recip.fundRate[i] / 100;
            payable(_recip.recipientsAddress[i]).transfer(tempAmount);
        }
        
        tempAmount = _balance * _stakeFund.fundRate / 100;
        payable(_stakeFund.poolAddress).transfer(tempAmount);
        StakeNFT _contract = StakeNFT(payable(_stakeFund.poolAddress));
        _contract.updateRewardSupply(tempAmount);
    }

    function distributeUSDC() onlyOwner external {
        uint256 _balance = IERC20(USDC).balanceOf(address(this));
        uint256 tempAmount = 0;
        for(uint i=0; i<_recip.recipientsAddress.length; i++) {
            tempAmount = _balance * _recip.fundRate[i] / 100;
            IERC20(USDC).transfer(_recip.recipientsAddress[i], tempAmount);
        }

        tempAmount = _balance * _stakeFund.fundRate / 100;
        IERC20(USDC).transfer(_stakeFund.poolAddress, tempAmount);
        StakeNFT _contract = StakeNFT(payable(_stakeFund.poolAddress));
        _contract.updateRewardSupply(tempAmount);
    }
}