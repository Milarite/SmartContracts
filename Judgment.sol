pragma solidity ^0.4.17;
import "./Candidates.sol";
contract Judgment
{
    
    Candidates candidates = new Candidates();
    
    struct judgmentInformation
    {
        
        
         string judgmentIdNumber;
         string name;
         string birthOfDate;
         string password;
         

    }
    
    
    
    mapping (string=>judgmentInformation) judgmentInformationMap;
    
    
    function addJudgmentInformation (string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgmentInformationMap[judgmentInformationId] = judgmentInformation(judgmentInformationId,name,birthOfDate,password);
    }
    
    
   function checkIdAndPassword(string nationalId,string password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(judgmentInformationMap[nationalId].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }
    
   
    
    //////// end of getter

}