// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @dev 测试 send 与 transfer 发送以太的区别
contract TestSendAndTransfer {
    /// @dev 状态变量 - 用于测试send与trnasfer
    string message;

    /// @dev 构造函数，初始化状态变量message
    constructor() {
        message = "hello";
    }

    /// @dev 存款，若部署时忘记存款，可直接调用此函数向合约账户存款
    function deposit() external payable {
    }

    /// @dev 发送以太 - send
    function sendEther(address _addr) external returns (bool) {
        bool result = payable(_addr).send(2);
        if (result) {
            message = "send success";
        } else {
            message = "send fail";
        }
        return result;
    }

    /// @dev 发送以太 - transfer
    function transferEther(address _addr) external {
        payable(_addr).transfer(2);
        message = "transfer success";
    }

    /// @dev 查看合约账户余额
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @dev 查看message
    function getMsg() external view returns (string memory) {
        return message;
    }

    /// @dev 设置message
    function setMsg(string memory _message) external {
        message = _message;
    }
}