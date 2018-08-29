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
    
    function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password,string city,string year,
    string phoneNumber) public {
        candidates.addCandidate(candidateIdNumber,name,birthOfDate,password);
        candidates.addCandidateDetails(candidateIdNumber,city,year,phoneNumber);
    }
    
    
    function getCandidateName(string candidateId) public view returns(string){
        
       return candidates.getCandidateName(candidateId);
    }
    
    
    
    
    
    
    
   
    
    
    
    
    

    
    
    
    
    
    
     
     
       

    
       
       

    
    
    
    //////// end of getter

       
      
       
  
}










//////






