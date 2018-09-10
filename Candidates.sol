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
            string campaign;
      }
      struct candidateTracking
       {
           address UserAddress;
       //    string candidateIdNumber;
          uint numberOfVotes;
       }
       
       
       mapping (string => address) candidateIdToAddressMap;
       mapping (address =>candidateInformation ) candidateInformationMap;
       
       mapping (address=>candidateDetails) candidateDetailsMap;
       mapping (address=>candidateTracking) candidateTrackingMap;
       
       address [] arrayNationalID;
      
       function addCandidate(address _address,string candidateIdNumber , string name,string birthOfDate, string password) public {
        
        arrayNationalID.push(_address);
        candidateInformationMap[_address] = candidateInformation(_address,candidateIdNumber,name,birthOfDate,password);
        candidateIdToAddressMap[candidateIdNumber] = _address;
    //    candidatesIds.push(candidateIdNumber);
        
        
    }
    function getCandidatePhonenumber(address _address) public view returns(string){
        return candidateDetailsMap[_address].phoneNumber;
    }
    
     function getCandidateCampaign(address _address) public view returns(string){
        return candidateDetailsMap[_address].campaign;
     }
    function getNationalID(uint index)public view returns (address)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    function addCandidateDetails(address _address,string candidateIdNumber,string city,string year,string phoneNumber,string campaign) public{
        candidateDetailsMap[_address] = candidateDetails(_address,candidateIdNumber,city,year,phoneNumber,campaign);
    }
    
    function addCandidateTracking(address _address,uint numberOfVotes) public{
        candidateTrackingMap[_address] = candidateTracking(_address,numberOfVotes);
        
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
    
    
    function checkIdAndPassword(address _address,string password) public view returns (string)
    {
        if( keccak256(abi.encodePacked(candidateInformationMap[_address].password))== keccak256(abi.encodePacked(password)))
        {
            return "true";
        }
        else
        return "false";
    }
 
    //////// end of getter
    
    function getCandidateAddressByNationalId(string nationalId) public view returns(address){
        return candidateIdToAddressMap[nationalId];
    }
    
    
    
    
 
       
      
       
  
}