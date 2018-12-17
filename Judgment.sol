pragma solidity ^0.5.1;
contract Judgment
{
    
 
    struct judgmentInformation
    {
        
        address _address;
         string judgmentIdNumber;
         string name;
         string birthOfDate;
         string password;
         
 
    }
    
    mapping (address=>judgmentInformation) judgmentInformationMap;
    function addJudgmentInformation (address _address,string memory judgmentInformationId,string memory name,string memory birthOfDate,string memory password) public {
        
        judgmentInformationMap[_address] = judgmentInformation(_address,judgmentInformationId,name,birthOfDate,password);
    }
    
    
   function checkIdAndPassword(address _address,string memory password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(judgmentInformationMap[_address].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }
    
 
    //////// end of getter
 
}