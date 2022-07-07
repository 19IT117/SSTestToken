//SPDX-License-Identifier:MIT
pragma solidity 0.8.15;

interface IERC20Interface {

    function totalSupply() external view returns(uint);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);


    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
//1023847 1076097 1080589
contract SSToken is IERC20Interface{
    string public name = "SSTestToken";
    string public symbol = "SSTest";
    uint public decimals = 0;
    uint public override totalSupply;
    address public founder;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
 
    constructor(){
        totalSupply = 1000000;
        founder = msg.sender;
        balances[founder] = totalSupply;
    }
 
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
    // 59791 59791
    function transfer(address _to, uint256 _value) public returns (bool success){
         require(balances[msg.sender]>=_value);
         
             balances[_to] += _value;
             balances[msg.sender] -= _value;
        
         emit Transfer(msg.sender,_to,_value);
         return true; 
    }

   //56258 56258
   function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        require(balances[msg.sender]>= _value);
        require(_value>0);

        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender , _spender, _value);
        return true;
    }
    
    //47150 47785
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(allowed[_from][msg.sender] >= _value);
        require(balances[_from]>=_value);

            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            balances[_to] +=_value;
     

        emit Transfer(_from,_to,_value);
        return true;
    }
}
