# 智能合约：一个合约调用另一个合约

## 合约BaseContract实现了ERC20接囗

先部署合约BaseContract， 得到合约地址：0x0fC5025C764cE34df352757e82f7B5c4Df39A836 （每次部署合约地址不同，记录自己部署的合约地址）

# 合约CallBaseContract 调用合约BaseContract
合约CallBaseContract中，修改构造函数中的状态变量baseContractAddr = 0x0fC5025C764cE34df352757e82f7B5c4Df39A836 （自己部署BaseContract得到的合约地址） 

部署合约CallBaseContract，在此合约中进行测试，测试可参考：https://blog.csdn.net/ling1998/article/details/124507451#comments_21830871