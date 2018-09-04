pragma solidity ^0.4.24;


contract Voters
{
    struct  voterInfo 
    {
         address UserAddress;
        string voterIdNumber;
        string name;
        string birthOfDate;
        
        string password;
        
    }
    struct voterDetails
    {
        address UserAddress;
        string voterIdNumber;
        string city;
        string year;
    
    }
    
    struct votersVotes{
        address voterAddress;
      //  string voterIdNumber;
        address candidateAddress;
    }
    
   votersVotes[] votersVotesArray;
   
   mapping(address => votersVotes[]) mapVotersVotes;
   
    mapping (address=>voterInfo) voterInfoMap;
    mapping (address => voterDetails) voterDetailsMap;
    mapping (address => votersVotes) votersVotesMap;
    
     address [] arrayNationalID;

    function addVoterInfo(address _address,string voterIdNumber,string name,string birthOfDate,string password) public {
                arrayNationalID.push(_address);
        voterInfoMap[_address] = voterInfo(_address,voterIdNumber,name,birthOfDate,password);
    }
    
    function addVoterDetails (address _address,string voterIdNumber,  string city,string year) public {
        voterDetailsMap[_address] = voterDetails(_address,voterIdNumber,city,year);
    }
    
        function getNationalID(uint index)public view returns (address)
    {
        return arrayNationalID[index];
    }
    
    function getNationalIDArrayLength() public view returns (uint)
    {
        return arrayNationalID.length;
    }
    

    
    function addVoterVotes(address voterAddress,address candidateAddress) public view returns (string) {
        
              if(getNumberOfVotes(voterAddress) >= 5)
                    return "You cant vote more than 5 candidates";
                
             for (uint i = 0 ; i < mapVotersVotes[voterAddress].length ; i++ ){
            if(keccak256(abi.encodePacked(mapVotersVotes[voterAddress][i].candidateAddress)) == keccak256(abi.encodePacked(candidateAddress)))
                return "You already voted to this candidate before";
       
        }
        mapVotersVotes[voterAddress].push(votersVotes(voterAddress,candidateAddress));
        return "Done";
    }
    

   
   function getNumberOfVotes(address _address)public view returns(uint)
   {
      
         return   mapVotersVotes[_address].length;
   }
    
    
    function deleteVoterDetail(address _address) public{
        delete (voterDetailsMap[_address]);
    }
    
    // function getCandidateByVoterDetails(address _address)public view  returns(string)  {
    //     return votersVotesMap[_address].candidateIdNumber;
    // }
    
    
     function getVoterCity(address _address) public view returns(string){
        return voterDetailsMap[_address].city;
    }
    
    
      function getVoterYear(address _address) public view returns(string){
        return voterDetailsMap[_address].year;
    }
    
    function getVoterName(address _address)  public view returns(string) {
        return voterInfoMap[_address].name;
    }
    
    function getVoterDateOfBirth (address _address)public view returns(string){
        return voterInfoMap[_address].birthOfDate;
    }
    
     function checkIdAndPassword(address _address,string password) public view returns (bool)
    {
        if( keccak256(abi.encodePacked(voterInfoMap[_address].password))== keccak256(abi.encodePacked(password)))
        {
            return true;
        }
        else
        return false;
    }
   
    
    
    
    
    
    
}