pragma solidity ^0.4.17;
import "./Candidates.sol";
contract Judgment
{
    
    Candidates candidates = new Candidates();
    
    struct judgmentInformation
    {
        
        address _address;
         string judgmentIdNumber;
         string name;
         string birthOfDate;
         string password;
         

    }
    
    
    
    mapping (address=>judgmentInformation) judgmentInformationMap;
    
    
    function addJudgmentInformation (address _address,string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgmentInformationMap[_address] = judgmentInformation(_address,judgmentInformationId,name,birthOfDate,password);
    }
    
    
   function checkIdAndPassword(address _address,string password) public view returns (bool)
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