pragma solidity ^0.4.0;
import "./timing.sol";

//import "./token.sol";
contract portfolioManagerProfile {
    uint256 d1;
    struct portfolioManager{
        address pAddress;
        uint256 time;
        uint256 date;
        uint256 totalValueOfToken;
        uint256 totalether;
        
    }
    mapping(address=>portfolioManager)portfolio;
    address[]  portfolioProfile;
     using DateTime for uint16;
   
     function getdate()public view returns(uint256,uint256,uint256){
         return (DateTime.getDay(d1),DateTime.getMonth(d1),DateTime.getYear(d1));
     }
     function get()public view returns(address[]){
         return portfolioProfile;
     }
    //totalSupply();
    //balanceOf(address _addr);
}