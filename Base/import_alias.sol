// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

import "https://github.com/tracyzhang1998/smartcontract/blob/main/Security/Reentrancy/reentrancy.sol" as alias_new;

contract TestImport {

    function getAddr() external returns (address) {
        //调用导入合约时，加上别名
        alias_new.EtherStore addr = new alias_new.EtherStore();
        return address(addr);
    }

}