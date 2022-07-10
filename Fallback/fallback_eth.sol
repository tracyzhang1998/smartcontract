// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
// 包含fallback函数的合约，合约账户能够接收到其它合约转的以太
contract TestFallback {
    string message;
 
    //构造函数，初始化状态变量message，同时可向合约账户存款
    constructor() payable {
        message = "hello";
    }
 
    //回退函数，能够为此合约账户接收以太
    fallback() external payable {
    }
 
    //存款，若部署时忘记存款，可直接调用此函数向合约账户存款
    function deposit() external payable {
    }
 
    //发送以太
    function sendEther(address _addr) external {
        bool result = payable(_addr).send(2);
        require(result, "send fail");
    }
    
    //查看合约账户余额
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
 
 
// 不包含fallback函数的合约
contract TestWithoutFallback {
 
    //构造函数，初始化时可向合约账户存款
    constructor() payable{
    }
 
    //存款，若部署时忘记存款，可直接调用此函数向合约账户存款
    function deposit() external payable {
    }
 
    //发送以太
    function sendEther(address _addr) external returns (bool) {
        bool result = payable(_addr).send(2);
        return result;
    }
 
    //查看合约账户余额
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}