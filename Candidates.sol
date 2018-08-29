pragma solidity ^0.4.17;
contract Candidates
{
    struct candidateInformation
    {
        
         string candidateIdNumber;
         string name;
         string birthOfDate;
         string password;

    }
       struct candidateDetails
       {
           
           string candidateIdNumber;
            string city;
            string year;
            string phoneNumber;
       }
       struct candidateTracking
       {
           string candidateIdNumber;
          uint numberOfVotes;
       }
       
       mapping (string =>candidateInformation ) candidateInformationMap;
       
       mapping (string=>candidateDetails) candidateDetailsMap;
       mapping (string=>candidateTracking) candidateTrackingMap;
       
       
      
    function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password) public {
        
        candidateInformationMap[candidateIdNumber] = candidateInformation(candidateIdNumber,name,birthOfDate,password);
        
        
    }
    
    function addCandidateDetails(string candidateIdNumber,string city,string year,string phoneNumber) public{
        candidateDetailsMap[candidateIdNumber] = candidateDetails(candidateIdNumber,city,year,phoneNumber);
    }
    
    function addCandidateTracking(string candidateIdNumber,uint numberOfVotes) public{
        candidateTrackingMap[candidateIdNumber] = candidateTracking(candidateIdNumber,numberOfVotes);
        
        
        
        
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(string candidateIdNumber) public view returns(uint){
        return candidateTrackingMap[candidateIdNumber].numberOfVotes;
    }
    
    
    
    /////// getter values
    
    
    
    function getCandidateName(string CandidateIdNumber) public view returns(string){
        return candidateInformationMap[CandidateIdNumber].name;
    }
    
    function getCandidatebirthOfDate(string CandidateIdNumber) public view returns(string){
        return candidateInformationMap[CandidateIdNumber].birthOfDate;
    }
    
    
    
 
    
    
    
    //////// end of getter

       
      
       
  
}










//////






