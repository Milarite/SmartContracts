pragma solidity ^0.5.1;
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
           string txtHash;
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
       
       function getCandidateTxtHashStatusLength(string memory candidateIdNumber)public view returns (uint)
       {
           return mappingcandidateTxtHashStatus[candidateIdNumber].length;
       }
       
       function getTxtHash(string memory nationalId,uint index)public view returns (string memory)
       {
           return mappingcandidateTxtHashStatus[nationalId][index].txtHash;
       }
       
         function getTxtHashFlag(string memory nationalId,uint index)public view returns (int)
       {
           return mappingcandidateTxtHashStatus[nationalId][index].flag;
       }
       
       function addTxtHashToCandidate(string memory nationalIdCandidate,string memory txtHash) public
       {
           mappingcandidateTxtHashStatus[nationalIdCandidate].push(candidateTxtHashStatus(nationalIdCandidate,txtHash,1));
       }
       function removeTxtHashToCandidate(string memory nationalIdCandidate,string memory txtHash) public
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
       
       
       
       function deleteCandidate(string memory _nationalId)public
       {
           delete(candidateInformationMap[_nationalId]);
           delete(candidateDetailsMap[_nationalId]);
           delete(candidateTrackingMap[_nationalId]);
        //   delete(candidateIdToAddressMap[_nationalId]);

       }
      
       function addCandidate(string memory  candidateIdNumber , string memory name,string memory birthOfDate, string memory  password) public {
        
        arrayNationalID.push(candidateIdNumber);
        candidateInformationMap[candidateIdNumber] = candidateInformation(candidateIdNumber,name,birthOfDate,password);
        candidateIdExist[candidateIdNumber] = true;
       
    //    candidatesIds.push(candidateIdNumber);
        
        
    }
    function getCandidatePhonenumber(string memory _nationalId) public view returns(string memory){
        return candidateDetailsMap[_nationalId].phoneNumber;
    }
    
     function getCandidateCampaign(string memory _nationalId) public view returns(string memory){
        return candidateDetailsMap[_nationalId].campaign;
     }
    function getNationalID(uint index)public view returns (string memory)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    function addCandidateDetails(string memory candidateIdNumber,string memory city,string memory year,string memory phoneNumber,string memory campaign) public{
        candidateDetailsMap[candidateIdNumber] = candidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
    }
    
    function addCandidateTracking(string memory _nationalId,uint numberOfVotes) public{
        candidateTrackingMap[_nationalId] = numberOfVotes;
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(string memory _nationalId) public view returns(uint){
        return candidateTrackingMap[_nationalId];
    }
    
    
    
    /////// getter values
    
    
    
    function getCandidateName(string memory _nationalId) public view returns(string memory){
        return candidateInformationMap[_nationalId].name;
    }
    
    function getCandidatebirthOfDate(string memory _nationalId) public view returns(string memory){
        return candidateInformationMap[_nationalId].birthOfDate;
    }
    
    
    
   function getCandidateCity(string memory _nationalId) public view returns(string memory){
        return candidateDetailsMap[_nationalId].city;
    }
    
    
      function getCandidateYear(string memory _nationalId) public view returns(string memory){
        return candidateDetailsMap[_nationalId].year;
    }
    
    
    
    

    
    function getCandidatePassword(string memory _nationalId) public view returns(string memory){
         return candidateInformationMap[_nationalId].password;
    } 
    
    
    function checkIdAndPassword(string memory _nationalId,string memory password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(candidateInformationMap[_nationalId].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }
 
    //////// end of getter
    
    function getCandidateAddressByNationalId(string memory nationalId) public view returns(bool){
        return candidateIdExist[nationalId];
    }
    
    function getCandidateNationalId(string memory _nationalId) public view returns(string memory){
        
        return candidateInformationMap[_nationalId].candidateIdNumber; 
        
    }
    
    
    function winnerCandidate() public view returns (string memory) {
      
       string memory national_id=arrayNationalID[0];
       uint max = candidateTrackingMap[national_id];
       for (uint i =1 ; i< arrayNationalID.length ; i ++)
       {
          
         
           if(candidateTrackingMap[arrayNationalID[i]] > max)
           {
               max = candidateTrackingMap[arrayNationalID[i]];
               national_id = arrayNationalID[i];
           }
           
       }
       
       return national_id;
        
    }
    
    



    
    
    
    
    
    
    
    
 
       
      
       
  
}