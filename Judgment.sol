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
    

    
   
    
    //////// end of getter

}