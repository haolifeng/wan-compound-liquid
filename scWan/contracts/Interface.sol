// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

//ERC20 interface
interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

//Compound cERC20 interface
interface CErc20 {
  function balanceOf(address) external view returns (uint);
  function mint(uint) external returns (uint);
  function exchangeRateCurrent() external returns (uint);
  function supplyRatePerBlock() external returns (uint);
  function balanceOfUnderlying(address) external returns (uint);
  function redeem(uint) external returns (uint);
  function redeemUnderlying(uint) external returns (uint);
  function borrow(uint) external returns (uint);
  function borrowBalanceCurrent(address) external returns (uint);
  function borrowRatePerBlock() external view returns (uint);
  function repayBorrow(uint) external returns (uint);
  function liquidateBorrow(
    address borrower,
    uint amount,
    address collateral
  ) external returns (uint);
}

//Compound CETH interface
interface CEth {
  function balanceOf(address) external view returns (uint);
  function mint() external payable;
  function exchangeRateCurrent() external returns (uint);
  function supplyRatePerBlock() external returns (uint);
  function balanceOfUnderlying(address) external returns (uint);
  function redeem(uint) external returns (uint);
  function redeemUnderlying(uint) external returns (uint);
  function borrow(uint) external returns (uint);
  function borrowBalanceCurrent(address) external returns (uint);
  function borrowRatePerBlock() external view returns (uint);
  function repayBorrow() external payable;
  function liquidateBorrow(address borrower, address cTokenCollateral) external payable;
}

//Compound Comptroller interface
interface Comptroller {
  function markets(address)
    external
    view
    returns (
      bool,
      uint,
      bool
    );
  function enterMarkets(address[] calldata) external returns (uint[] memory);
  function getAccountLiquidity(address)
    external
    view
    returns (
      uint,
      uint,
      uint
    );
  function closeFactorMantissa() external view returns (uint);
  function liquidationIncentiveMantissa() external view returns (uint);
  function liquidateCalculateSeizeTokens(
    address cTokenBorrowed,
    address cTokenCollateral,
    uint actualRepayAmount
  ) external view returns (uint, uint);
}

//Compound price feed interface
interface PriceFeed {
  function getUnderlyingPrice(address cToken) external view returns (uint);
}
