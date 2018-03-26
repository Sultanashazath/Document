pragma solidity ^0.4.18;
import "./invseters.sol";
contract MutualFund is portfolioManagerProfile
{
    string standard="Token 1.0";
    string public name;
    string public symbol;
    uint256 public totalsupply;
    uint256  initialallowed;
    uint256 public decimals;
  
    address Owner;
  

    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint256))public allowed;

    function MutualFund(string _name,string _symbol,uint256 _decimals,uint256 _totalsupply)public
    {
        totalsupply = _totalsupply;
        balanceOf[msg.sender]=totalsupply;
        symbol= _symbol;
        name=_name;
        initialallowed=500;
        decimals= _decimals;
        Owner = msg.sender;
        
    }
    

    function transfer(address to, uint256 value) public returns (bool)
    {
        require(value<=balanceOf[msg.sender]);
        balanceOf[msg.sender]=balanceOf[msg.sender]-value;
        balanceOf[to]=balanceOf[to]+value;
       // Transfer(msg.sender,to,value);
        return true;
    }
    function transferFrom(address from,address to,uint256 value)public returns(bool){
        require(value<=balanceOf[msg.sender]);
         balanceOf[from]=balanceOf[from]-value;
        balanceOf[to]=balanceOf[to]+value;
        return true;
    }
    function totalSupply() public view returns (uint256)
    {
       return totalsupply;
    }
    function balanceOf(address _addr) public view returns (uint256)
    {
        return balanceOf[_addr];
    }
     
    function purchaseOtherTokens(address pAddress,uint value)public payable  returns(uint256){
        
    
      portfolio[pAddress].pAddress=pAddress;
      d1=portfolio[pAddress].time=now;
      if(msg.value!=0){
          
     transfer(pAddress,value);
      }
      portfolioProfile.push(pAddress);
       portfolio[pAddress].totalether=pAddress.balance;
      return portfolio[pAddress].time;
      
     }
    
        
}