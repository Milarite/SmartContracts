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
      
      struct candidateTxtHashStatus
      {
           string candidateIdNumber;
           address txtHash;
           int flag;
          
      }
      
      /////////////
     mapping (string => candidateTxtHashStatus[]) mappingcandidateTxtHashStatus;
     ///////////////

      mapping (string => uint) candidateTrackingMap;
       
       
       mapping (string => bool) candidateIdExist;
       mapping (string =>candidateInformation ) candidateInformationMap;
       
       mapping (string=>candidateDetails) candidateDetailsMap;

       string [] arrayNationalID;
       
       ////////////
       
       function getCandidateTxtHashStatusLength(string candidateIdNumber)public view returns (uint)
       {
           return mappingcandidateTxtHashStatus[candidateIdNumber].length;
       }
       
       function getTxtHash(string nationalId,uint index)public view returns (address)
       {
           return mappingcandidateTxtHashStatus[nationalId][index].txtHash;
       }
       
         function getTxtHashFlag(string nationalId,uint index)public view returns (int)
       {
           return mappingcandidateTxtHashStatus[nationalId][index].flag;
       }
       
       function addTxtHashToCandidate(string nationalIdCandidate,address txtHash) public
       {
           mappingcandidateTxtHashStatus[nationalIdCandidate].push(candidateTxtHashStatus(nationalIdCandidate,txtHash,1));
       }
       function removeTxtHashToCandidate(string nationalIdCandidate,address txtHash) public
       {
           for(uint i=0;i<mappingcandidateTxtHashStatus[nationalIdCandidate].length;i++)
           {
               if(keccak256(abi.encodePacked(mappingcandidateTxtHashStatus[nationalIdCandidate][i].txtHash))==keccak256(abi.encodePacked(txtHash)))
               {
                 
                 mappingcandidateTxtHashStatus[nationalIdCandidate][i].flag=-1;
                 break;

               }
           }
       }
       //////////////////////
       
       
       
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
        candidateIdExist[candidateIdNumber] = true;
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
    
    function getCandidateAddressByNationalId(string nationalId) public view returns(bool){
        return candidateIdExist[nationalId];
    }
    
    function getCandidateNationalId(string _nationalId) public view returns(string){
        
        return candidateInformationMap[_nationalId].candidateIdNumber; 
        
    }
    
    
    
    
 
       
      
       
  
}