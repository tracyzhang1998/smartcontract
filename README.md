# 智能合约示例

## 目录：ERC20 
### 一个合约调用另一个合约
合约脚本参见ERC-20目录

#### 合约BaseContract实现了ERC20接囗

先部署合约BaseContract， 得到合约地址：0x0fC5025C764cE34df352757e82f7B5c4Df39A836 （每次部署合约地址不同，记录自己部署的合约地址）

#### 合约CallBaseContract 调用合约BaseContract
合约CallBaseContract中，修改构造函数中的状态变量baseContractAddr = 0x0fC5025C764cE34df352757e82f7B5c4Df39A836 （自己部署BaseContract得到的合约地址） 

部署合约CallBaseContract，在此合约中进行测试，测试可参考：https://blog.csdn.net/ling1998/article/details/124507451#comments_21830871

## 目录：Base
### arithmetic_overflow_less0.8.0.sol
### arithmetic_overflow_greater0.8.0.sol
测试0.8.0新特性 - unchecked模式与checked模式
可参考：https://blog.csdn.net/ling1998/article/details/125550140?spm=1001.2014.3001.5502

### import_url.sol 
导入url中的合约
### import_alias.sol 
导入的合约起别名及其用法
可参考：https://blog.csdn.net/ling1998/article/details/124558163?spm=1001.2014.3001.5502

### error.sol 
0.8.4新增结构 - error
可参考：https://blog.csdn.net/ling1998/article/details/125548188?spm=1001.2014.3001.5502

### send_transfer.sol
测试 send 与 transfer 发送以太的区别
可参考：https://blog.csdn.net/ling1998/article/details/124558163?spm=1001.2014.3001.5502

## 目录：Fallback 为测试回退函数的2种触发执行方式
### fallback.sol 
如果在一个合约的调用中，没有其他函数与给定的函数标识符匹配时（或没有提供调用数据）,fallback函数会被执行。
### fallback_eth.sol
当合约收到以太币时，fallback函数会被执行。

关于部署及测试可参考：https://blog.csdn.net/ling1998/article/details/125488149?spm=1001.2014.3001.5502


## 目录：Security 关于智能合约安全示例
## 目录 Security/Reentrancy 重入攻击
### reentrancy.sol 
模拟重入攻击
### reentrancy_solution_x.sol 
重入攻击的3种解决方案

关于部署及测试可参考：https://blog.csdn.net/ling1998/article/details/125473315?spm=1001.2014.3001.5502
