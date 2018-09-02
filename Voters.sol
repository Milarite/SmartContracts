pragma solidity ^0.4.24;


contract Voters
{
    struct  voterInfo 
    {
        string voterIdNumber;
        string name;
        string birthOfDate;
        
        string password;
    }
    struct voterDetails
    {
        string voterIdNumber;
        string candidateIdNumber;
        string city;
        string year;
    
    }
    
    struct votersVotes{
        string voterIdNumber;
        string candidateIdNumber;
    }
    
   votersVotes[] votersVotesArray;
   
    mapping (string=>voterInfo) voterInfoMap;
    mapping (string => voterDetails) voterDetailsMap;
    mapping (string => votersVotes) votersVotesMap;
    
     string [] arrayNationalID;

    function addVoterInfo(string voterIdNumber,string name,string birthOfDate,string password) public {
                arrayNationalID.push(voterIdNumber);
        voterInfoMap[voterIdNumber] = voterInfo(voterIdNumber,name,birthOfDate,password);
    }
    
    function addVoterDetails (string voterIdNumber, string candidateIdNumber, string city,string year) public {
        voterDetailsMap[voterIdNumber] = voterDetails(voterIdNumber,candidateIdNumber,city,year);
    }
    
        function getNationalID(uint index)public view returns (string)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    
    
    
    function addVoterVotes(string voterIdNumber,string  candidateIdNumber) public returns(string){
      if(getVoterVotes(voterIdNumber) >= 5)
      return "You cant vote more than 5 candidates";
      
        for (uint i = 0 ; i < votersVotesArray.length ; i++ ){
            if(keccak256(abi.encodePacked(votersVotesArray[i].candidateIdNumber)) == keccak256(abi.encodePacked(candidateIdNumber))){
                
                return "You already voted to this candidate before";
                
            }
            
            
        }
        
        
        votersVotesArray.push(votersVotes(voterIdNumber,candidateIdNumber));
        
        

    }
    
    function getVoterVotes(string voterIdNumber) public view returns(uint){
        uint counter = 0;
        
        for(uint i=0 ; i<votersVotesArray.length;i++){
            if(keccak256(abi.encodePacked(votersVotesArray[i].voterIdNumber)) == keccak256(abi.encodePacked(voterIdNumber)) )
            {
                counter++;
            }
        }
        
        return counter;
    }
    
   
    
    
    function deleteVoterDetail(string voterIdNumber) public{
        delete (voterDetailsMap[voterIdNumber]);
    }
    
    function getCandidateByVoterDetails(string voterIdNumber)public view  returns(string)  {
        return voterDetailsMap[voterIdNumber].candidateIdNumber;
    }
    
    
     function getVoterCity(string CandidateIdNumber) public view returns(string){
        return voterDetailsMap[CandidateIdNumber].city;
    }
    
    
      function getVoterYear(string CandidateIdNumber) public view returns(string){
        return voterDetailsMap[CandidateIdNumber].year;
    }
    
    function getVoterName(string voterIdNumber)  public view returns(string) {
        return voterInfoMap[voterIdNumber].name;
    }
    
    function getVoterDateOfBirth (string voterIdNumber)public view returns(string){
        return voterInfoMap[voterIdNumber].birthOfDate;
    }
    
   
    
    
    
    
    
    
}