pragma solidity^0.6.0;
 
import "../ERC-20/IERC20.sol";
import "../ERC-20/lib/SafeMath.sol";
 
contract BaseContract is IERC20{
    //对uint256类型使用安全运算
    using SafeMath for uint256;
 
    //发行币名称
    string private _name;
    //发行总量
    uint256 private _totalSupply;
    //账户中币的余额
    mapping(address=>uint256) private _balance;
    //授权账户余额
    mapping(address=>mapping(address=>uint256)) private _allowance;
    //管理员
    address admin;
 
    constructor(string memory name) public {
        _name = name;
        _totalSupply = 0;
        admin = msg.sender;
    }
 
    //查看币名称
    function getName() external view returns (string memory){
        return _name;
    }
 
    //Mint(部署合约的人-管理员)
    function mint(address to, uint256 value) external {
        require(msg.sender == admin, "操作人必须是管理员");
        require(address(0) != to, "收款人地址不能为空");
 
        //收币人余额增加
        _balance[to] = _balance[to].add(value);
 
        //发行总额增加
        _totalSupply = _totalSupply.add(value);
 
        emit Transfer(msg.sender,to,value);
    }
 
    //发行总量
    function totalSupply() external override view returns (uint256){
        return _totalSupply;
    }
 
    //查看账户中的余额（token）
    function balanceOf(address who) external override view returns (uint256) {
        return _balance[who];
    }
 
    //查看授权余额
    function allowance(address owner, address spender)
        external override view returns (uint256){
        return _allowance[owner][spender];
    }
 
    //转账
    function transfer(address to, uint256 value) external override returns (bool) {
        require(value > 0, "转账金额要大于0");
        require(address(0) != to,"收款人地址不能为空");
        require(_balance[msg.sender] >= value, "付款人余额要大于等于转账金额");
 
        //付款人余额减少
        _balance[msg.sender] = _balance[msg.sender].sub(value);
 
        //收款人余额增加
        _balance[to] = _balance[to].add(value);
 
        //发送转账通知
        emit Transfer(msg.sender,to,value);
    }
 
    //授权
    function approve(address spender, uint256 value) external override returns (bool) {
        require(address(0) != spender,"被授权人地址不能为空");
        require(_balance[msg.sender] >= value, "授权人金额要大于等于授权金额");
 
        //授权
        _allowance[msg.sender][spender] = value;
    }
 
    //授权转账
    function transferFrom(address from, address to, uint256 value) external override returns (bool) {
        require(value > 0 , "授权转账金额大于0");
        require(address(0) != to , "收款人地址不能为空");
        require(_balance[from] >= value, "付款人金额要大于等于转账金额");
        require(_allowance[from][msg.sender] >= value, "授权金额要大于等于转账金额");
 
        //授权金额减少
        _allowance[from][msg.sender] = _allowance[from][msg.sender].sub(value);
 
        //付款人金额减少
        _balance[from] = _balance[from].sub(value);
 
        //收款人金额增加
        _balance[to] = _balance[to].add(value);
 
        emit Transfer(from, to, value);
    }
}