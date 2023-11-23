// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './stake.sol';

/**
 * @title factory
 * @author vlad
 * @notice Implements the master staketoken contract to keep track of all tokens being added
 * to be staked and staking.
 */
contract factory {
  // this a particular address for the token that someone has put up
  // to be staked and a list of contract addresses for the staking token
  // contracts paying out stakers for the given token.
  address public farmingContract;
  uint256 public totalStakingContracts;

  event Deposit(address indexed user, uint256 amount);

  /**
   * @notice The constructor for the staking master contract.
   */
  constructor()
  {
      totalStakingContracts = 0;
  }

  receive() external payable {}

  function getFarmingContract() external view returns (address) {
    return farmingContract;
  }

  function getTotalStakingContracts() external view returns ( uint256 ) {
    return totalStakingContracts;
  }

  function createNewTokenContract(
    address _rewardsTokenAddy,
    address _stakedTokenAddy,
    uint256 _supply,
    uint256 _rewardPercent,
    uint256 _period,
    uint256 _timelockSeconds
  ) external payable {
    require(totalStakingContracts == 0, "already exist pool");
    // create new StakeToken contract which will serve as the core place for
    // users to stake their tokens and earn rewards
    // in order to handle tokens that take tax, are burned, etc. when transferring, need to get
    // the user's balance after transferring in order to send the remainder of the tokens
    // instead of the full original supply. Similar to slippage on a DEX
    uint256 _updatedSupply = 0;
    // Send the new contract all the tokens from the sending user to be staked and harvested
    if(_rewardsTokenAddy == 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE){
        require(msg.value >= _supply, "must be more than supply");
        payable(address(this)).transfer(msg.value);
        _updatedSupply = _supply <= address(this).balance
        ? _supply
        : address(this).balance;
    } else {
        ERC20 _rewToken = ERC20(_rewardsTokenAddy);
        _rewToken.transferFrom(msg.sender, address(this), _supply);
        _updatedSupply = _supply <= _rewToken.balanceOf(address(this))
        ? _supply
        : _rewToken.balanceOf(address(this));
    }

    StakeNFT _contract = new StakeNFT(
      _updatedSupply,
      _rewardsTokenAddy,
      _stakedTokenAddy,
      msg.sender,
      _rewardPercent,
      _period,
      _timelockSeconds
    );
    farmingContract = address(_contract);
    totalStakingContracts++;
    
    // do one more double check on balance of rewards token
    // in the staking contract and update if need be
    uint256 _finalSupply = 0;
    if(_rewardsTokenAddy == 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE) {
        payable(address(_contract)).transfer(_updatedSupply);
        _finalSupply = _updatedSupply <=
        address(_contract).balance
        ? _updatedSupply
        : address(_contract).balance;
    } else {
        ERC20 _rewToken = ERC20(_rewardsTokenAddy);
        _rewToken.transfer(address(_contract), _updatedSupply);
        _finalSupply = _updatedSupply <=
        _rewToken.balanceOf(address(_contract))
        ? _updatedSupply
        : _rewToken.balanceOf(address(_contract));
    }

    if (_updatedSupply != _finalSupply) {
      _contract.updateSupply(_finalSupply);
    }
  }

  function removeTokenContract(address _faasTokenAddy) external {
    StakeNFT _contract = StakeNFT(payable(_faasTokenAddy));
    require(
      msg.sender == _contract.tokenOwner(),
      'user must be the original token owner to remove tokens'
    );

    _contract.removeStakeableTokens();
    totalStakingContracts--;
  }

  function setAdmin(address _admin, address _faasTokenAddy) external {
    StakeNFT _contract = StakeNFT(payable(_faasTokenAddy));
    require(
      msg.sender == _contract.tokenOwner(),
      'user must be the original token owner to set admin'
    );

    _contract.setAdmin(_admin);
  }

  function getStakingBalance() external view returns (uint256) {
    StakeNFT _contract = StakeNFT(payable(farmingContract));
    return address(_contract).balance;
  }
}