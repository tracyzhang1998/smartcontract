// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6; 

/// @dev 测试0.8.0以前版本，溢出为截断模式
contract TestOverflow {  
    /// @dev 检查溢出（checked模式）
    function overflow() external pure returns (uint8) {
        uint8 a = 255;
        uint8 b = 5;
        return (a + b);
    }
}