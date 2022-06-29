// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

import "https://github.com/tracyzhang1998/smartcontract/blob/main/Security/Reentrancy/reentrancy.sol";

contract TestImport {

    function getAddr() external returns (address) {
        //调用导入合约
        EtherStore addr = new EtherStore();
        return address(addr);
    }

}
