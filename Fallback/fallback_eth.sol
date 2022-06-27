// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//fallback
contract TestFallback {
    string message;

    //构造函数，初始化状态变量message
    constructor() {
        message = "hello";
    }

    fallback() external {
        message = "fallback"; 
    }

    //调用此合约中不存在的函数
    function testFallback() external returns (bytes memory) {

        // 调用不存在的函数getMsgNew()
        bytes memory method = abi.encodeWithSignature("getMsgNew()");
        (bool success, bytes memory returnData) = address(this).call(method);

        require(success, "get fail");
        return returnData;
    }

    //调用此合约中已存在函数，但是没有传递参数
    function testFallbackWithNoParam() external returns (bytes memory) {

        // 调用已存在的函数setMsg()，未传递参数
        bytes memory method = abi.encodeWithSignature("setMsg()");
        (bool success, bytes memory returnData) = address(this).call(method);

        require(success, "set fail");
        return returnData;
    }

    function getMsg() external view returns (string memory) {
        return message;
    }

    function setMsg(string memory _message) external {
        message = _message;
    }
}
