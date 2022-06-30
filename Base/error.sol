// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; 

/// @dev 没有足够的金额
/// @param _balance表示当前合约账户余额
/// @param _amount 转账金额
/// @notice error结构在0.8.4及以上版本有效
error NotEnoughFunds(uint _balance,uint _amount);

contract TestError {
    /// @dev 事件 - 记录转账信息
    event Tansfer(address _from, address _to, uint _amount);

    /// @dev 当合约账户余额小于转账金额时，使用字符串 revert
    function transfer(address _to, uint _amount) external {
         if (address(this).balance < _amount) {
            revert("no enough funds");
        }
        emit Tansfer(msg.sender, _to, _amount);
    }

    /// @dev 当合约账户余额小于转账金额时，使用error revert
    function transferWithError(address _to, uint _amount) external {
        if (address(this).balance < _amount) {
            revert NotEnoughFunds(address(this).balance, _amount);
        }
        emit Tansfer(msg.sender, _to, _amount);
    }
}