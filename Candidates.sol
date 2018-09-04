pragma solidity ^0.4.17;
contract Candidates
{
    
    string [] candidatesIds;
    struct candidateInformation
    {
        address UserAddress;
         string candidateIdNumber;
         string name;
         string birthOfDate;
         string password;

    }
     struct candidateDetails
      {
           
           address UserAddress;
           string candidateIdNumber;
            string city;
            string year;
            string phoneNumber;
      }
      struct candidateTracking
       {
           address UserAddress;
           string candidateIdNumber;
          uint numberOfVotes;
       }
       
       mapping (address =>candidateInformation ) candidateInformationMap;
       
       mapping (address=>candidateDetails) candidateDetailsMap;
       mapping (address=>candidateTracking) candidateTrackingMap;
       
       string [] arrayNationalID;
      
       function addCandidate(address _address,string candidateIdNumber , string name,string birthOfDate, string password) public {
        
        arrayNationalID.push(candidateIdNumber);
        candidateInformationMap[_address] = candidateInformation(_address,candidateIdNumber,name,birthOfDate,password);
    //    candidatesIds.push(candidateIdNumber);
        
        
    }
    function getCandidatePhonenumber(address _address) public view returns(string){
        return candidateDetailsMap[_address].phoneNumber;
    }
    function getNationalID(uint index)public view returns (string)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    function addCandidateDetails(address _address,string candidateIdNumber,string city,string year,string phoneNumber) public{
        candidateDetailsMap[_address] = candidateDetails(_address,candidateIdNumber,city,year,phoneNumber);
    }
    
    function addCandidateTracking(address _address,string candidateIdNumber,uint numberOfVotes) public{
        candidateTrackingMap[_address] = candidateTracking(_address,candidateIdNumber,numberOfVotes);
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(address _address) public view returns(uint){
        return candidateTrackingMap[_address].numberOfVotes;
    }
    
    
    
    /////// getter values
    
    
    
    function getCandidateName(address _address) public view returns(string){
        return candidateInformationMap[_address].name;
    }
    
    function getCandidatebirthOfDate(address _address) public view returns(string){
        return candidateInformationMap[_address].birthOfDate;
    }
    
    
    
   function getCandidateCity(address _address) public view returns(string){
        return candidateDetailsMap[_address].city;
    }
    
    
      function getCandidateYear(address _address) public view returns(string){
        return candidateDetailsMap[_address].year;
    }
    
    
    
      function getCandidateNumberOfVotes(address _address) public view returns(uint){
        return candidateTrackingMap[_address].numberOfVotes;
    }
    
    function getCandidatePassword(address _address) public view returns(string){
         return candidateInformationMap[_address].password;
    } 
    
    
    function checkIdAndPassword(address _address,string nationalId,string password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(candidateInformationMap[_address].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }

    //////// end of getter

       
      
       
  
}
