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
            string campaign;
      }
      mapping (string => uint) candidateTrackingMap;
       
       
       mapping (string => address) candidateIdToAddressMap;
       mapping (string =>candidateInformation ) candidateInformationMap;
       
       mapping (string=>candidateDetails) candidateDetailsMap;

       string [] arrayNationalID;
       function deleteCandidate(string _nationalId)public
       {
           delete(candidateInformationMap[_nationalId]);
           delete(candidateDetailsMap[_nationalId]);
           delete(candidateTrackingMap[_nationalId]);
        //   delete(candidateIdToAddressMap[_nationalId]);

       }
      
       function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password)  {
        
        arrayNationalID.push(candidateIdNumber);
        candidateInformationMap[candidateIdNumber] = candidateInformation(candidateIdNumber,name,birthOfDate,password);
      //  candidateIdToAddressMap[candidateIdNumber] = _address;
    //    candidatesIds.push(candidateIdNumber);
        
        
    }
    function getCandidatePhonenumber(string _nationalId) public view returns(string){
        return candidateDetailsMap[_nationalId].phoneNumber;
    }
    
     function getCandidateCampaign(string _nationalId) public view returns(string){
        return candidateDetailsMap[_nationalId].campaign;
     }
    function getNationalID(uint index)public view returns (string)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    function addCandidateDetails(string candidateIdNumber,string city,string year,string phoneNumber,string campaign) public{
        candidateDetailsMap[candidateIdNumber] = candidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
    }
    
    function addCandidateTracking(string _nationalId,uint numberOfVotes) public{
        candidateTrackingMap[_nationalId] = numberOfVotes;
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(string _nationalId) public view returns(uint){
        return candidateTrackingMap[_nationalId];
    }
    
    
    
    /////// getter values
    
    
    
    function getCandidateName(string _nationalId) public view returns(string){
        return candidateInformationMap[_nationalId].name;
    }
    
    function getCandidatebirthOfDate(string _nationalId) public view returns(string){
        return candidateInformationMap[_nationalId].birthOfDate;
    }
    
    
    
   function getCandidateCity(string _nationalId) public view returns(string){
        return candidateDetailsMap[_nationalId].city;
    }
    
    
      function getCandidateYear(string _nationalId) public view returns(string){
        return candidateDetailsMap[_nationalId].year;
    }
    
    
    
    

    
    function getCandidatePassword(string _nationalId) public view returns(string){
         return candidateInformationMap[_nationalId].password;
    } 
    
    
    function checkIdAndPassword(string _nationalId,string password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(candidateInformationMap[_nationalId].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }
 
    //////// end of getter
    
    function getCandidateAddressByNationalId(string nationalId) public view returns(address){
        return candidateIdToAddressMap[nationalId];
    }
    
    function getCandidateNationalId(string _nationalId) public view returns(string){
        
        return candidateInformationMap[_nationalId].candidateIdNumber; 
        
    }
    
    
    
    
 
       
      
       
  
}