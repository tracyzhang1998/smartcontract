// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
 
interface IERC20{
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256); 
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
 
contract CallBaseContract{
    address public baseContractAddr;
 
    constructor(){
        baseContractAddr = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    }
 
    //转账
    function transferFrom(address from, address to, uint256 value) external {
        require(IERC20(baseContractAddr).balanceOf(from) >= value);
        IERC20(baseContractAddr).transferFrom(from,to,value);
    }
 
    //查看账户余额
    function balanceOf(address who) external view returns (uint256) {
        return IERC20(baseContractAddr).balanceOf(who);
    }
 
    //查看授权账户余额
    function allowance(address owner, address spender) external view returns (uint256){
        return IERC20(baseContractAddr).allowance(owner,spender);
    }
 
}
 