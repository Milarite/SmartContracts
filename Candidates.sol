pragma solidity ^0.4.17;
contract Candidates
{
    
    string [] candidatesIds;
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
       
       string [] arrayNationalID;
      
       function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password) public {
        
        arrayNationalID.push(candidateIdNumber);
        candidateInformationMap[candidateIdNumber] = candidateInformation(candidateIdNumber,name,birthOfDate,password);
    //    candidatesIds.push(candidateIdNumber);
        
        
    }
    function getCandidatePhonenumber(string CandidateIdNumber) public view returns(string){
        return candidateDetailsMap[CandidateIdNumber].phoneNumber;
    }
    function getNationalID(uint index)public view returns (string)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
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
    
    
    
   function getCandidateCity(string CandidateIdNumber) public view returns(string){
        return candidateDetailsMap[CandidateIdNumber].city;
    }
    
    
      function getCandidateYear(string CandidateIdNumber) public view returns(string){
        return candidateDetailsMap[CandidateIdNumber].year;
    }
    
    
    
      function getCandidateNumberOfVotes(string CandidateIdNumber) public view returns(uint){
        return candidateTrackingMap[CandidateIdNumber].numberOfVotes;
    }
    
    function getCandidatePassword(string nationalId) public view returns(string){
         return candidateInformationMap[nationalId].password;
    } 
    
    
    function checkIdAndPassword(string nationalId,string password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(candidateInformationMap[nationalId].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }

    //////// end of getter

       
      
       
  
}
