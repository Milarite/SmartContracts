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
   voterInfo [] arrayVoterInfo;
   
    mapping(address => votersVotes[]) mapVotersVotes;
    mapping (string =>address) singInMap;
    mapping (address=>voterInfo) voterInfoMap;
    mapping (address => voterDetails) voterDetailsMap;
    mapping (address => votersVotes) votersVotesMap;
    
     address [] arrayNationalID;
 
    function addVoterInfo(address _address,string voterIdNumber,string name,string birthOfDate,string password) public {
        arrayNationalID.push(_address);
        voterInfoMap[_address] = voterInfo(_address,voterIdNumber,name,birthOfDate,password);
        arrayVoterInfo.push(voterInfo(_address,voterIdNumber,name,birthOfDate,password) );
 
    }
    
    function addVoterDetails (address _address,string voterIdNumber,  string city,string year) public {
        voterDetailsMap[_address] = voterDetails(_address,voterIdNumber,city,year);
    }
        function getVotedCandidatesAddress(address voterAddress,uint idex)public view returns (address)
    {
        return mapVotersVotes[voterAddress][idex].candidateAddress;
    }
    
    function getNationalIDArrayLength(address voterAddress) public view returns (uint)
    {
        return mapVotersVotes[voterAddress].length;
    }
    
    function grantYourVote(address voterAddress,address candidateAddress)public
    {
              mapVotersVotes[voterAddress].push(votersVotes(voterAddress,candidateAddress));
  
    }
 
    function addVoterVotes(address voterAddress,address candidateAddress) public view  returns (string) {
        
              if(getNumberOfVotes(voterAddress) >= 5)
                    return "You cant vote more than 5 candidates";
                
             for (uint i = 0 ; i < mapVotersVotes[voterAddress].length ; i++ ){
            if(keccak256(abi.encodePacked(mapVotersVotes[voterAddress][i].candidateAddress)) == keccak256(abi.encodePacked(candidateAddress)))
                return "You already voted to this candidate before";
        }
       //  grantYourVote(voterAddress,candidateAddress);
         return "Done";
    }
    
 
   
   function getNumberOfVotes(address _address)public view returns(uint)
   {
      
         return   mapVotersVotes[_address].length;
   }
    
    function revokeMyVote(address _voterAddress, address _candidateAddress) public
    {
        for(uint i=0;i<mapVotersVotes[_voterAddress].length;i++)
        {
            if(mapVotersVotes[_voterAddress][i].candidateAddress==_candidateAddress)
            {
                 delete(mapVotersVotes[_voterAddress][i]);  
                 break;
            }
 
        }
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
    
     function checkIdAndPassword(string nationalID,string password) public view returns (address)
    {
        
        if( keccak256(abi.encodePacked(voterInfoMap[singInMap[nationalID]].password))== keccak256(abi.encodePacked(password)))
        {
            return voterInfoMap[singInMap[nationalID]].UserAddress;
        }
        else
        return 0x2;
        
    }
   
   function signUpVoter(address _address,string nationalID,string password,string name,string birthOfDate,string city,string year)public  
   {
       
       // if checkNationalID returned true ,,, exexcute this function
     addVoterInfo(_address,nationalID, name, birthOfDate, password);
     addVoterDetails (_address,nationalID,city, year);
     singInMap[nationalID]=_address;
   }
   function checkNationalID(string nationalID) public view returns (bool)
   {
       for(uint i=0;i<arrayVoterInfo.length;i++)
    {
     if( keccak256(abi.encodePacked(  arrayVoterInfo[i].voterIdNumber))==keccak256(abi.encodePacked(nationalID)))
     {
         return false;
     }
   
    }
   // signUpVoter( _address, nationalID, password, name, birthOfDate, city, year);
    return true;
   }
   
   
    
    
    
    
    
    
}