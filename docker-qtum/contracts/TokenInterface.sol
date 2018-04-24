pragma solidity ^0.4.19;

interface TokenInterface {

    function setStatus(bool _status) external;

    function getStatus() external constant returns (bool);

    function setAdmin(address account) external;

    function getAdmin() external constant returns (address);

    function balanceOf(address owner) external constant returns (uint);

    function transfer(address to, uint value) external returns (bool);

    function transferFrom(address from, address to, uint value) external returns (bool);

    function allowance(address owner, address spender) external constant returns (uint);

    function approve(address spender, uint value) external returns (bool);

    function increaseApproval(address spender, uint value) external returns (bool);

    function decreaseApproval(address spender, uint value) external returns (bool);

    function approveAndCall(byte symb, address spender, uint value, bytes extraData) external returns (bool success);
}