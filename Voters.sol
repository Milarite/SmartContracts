pragma solidity ^0.4.17;
 
 
contract Voters
{
    
    uint totalVotes=0;
    address constant _noAddress = 0x0000000000000000000000000000000000000000;
    modifier onlyVoter(address _voter){
       require(voterInfoMap[_voter].UserAddress != _noAddress );
       _;
    }
    struct  voterInfo 
    {
        address UserAddress;
        string privatekey;
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
        uint numberOfVotes;
    }
    
    struct votersVotes{
        address voterAddress;
      //  string voterIdNumber;
        string nationalId;
        string txtHash;
    }
   
   votersVotes[] votersVotesArray;
   //voterInfo [] arrayVoterInfo;
   
    mapping(address => votersVotes[]) mapVotersVotes;
    mapping (string =>address) singInMap;
    mapping (string => bool)signedUsers ;
    mapping (address=>voterInfo) voterInfoMap;
    mapping (address => voterDetails) voterDetailsMap;
    mapping (address => votersVotes) votersVotesMap;
    mapping (string => address[]) CandidateVoters ;
    
     address [] arrayNationalID;
     
     uint votesCount;
     string startDate;
     string period;
     string endTime;
      uint public NumberOfVoters;
 
    function addVoterInfo(address _address,string _privatekey,string voterIdNumber,string name,string birthOfDate,string password) public {
        arrayNationalID.push(_address);
        voterInfoMap[_address] = voterInfo(_address,_privatekey,voterIdNumber,name,birthOfDate,password);
        //arrayVoterInfo.push(voterInfo(_address,voterIdNumber,name,birthOfDate,password) );
        signedUsers[voterIdNumber] = true;
    }
    
    function addVoterDetails (address _address,string voterIdNumber,  string city,string year) public {
        voterDetailsMap[_address] = voterDetails(_address,voterIdNumber,city,year,0);
    }
        function getVotedCandidatesAddress(address voterAddress,uint idex)public view returns (string)
    {
        return mapVotersVotes[voterAddress][idex].nationalId;
    }
    
    ////////////////
    
        function getVotedCandidatesTxtHash(address voterAddress,uint idex)public view returns (string)
    {
        return mapVotersVotes[voterAddress][idex].txtHash;
    }
    
    ///////////////
    
    function getNationalIDArrayLength(address voterAddress) public view returns (uint)
    {
        return mapVotersVotes[voterAddress].length;
    }
    
    function grantYourVote(address voterAddress,string _candidateNationalId) public
    {
        ////////////////////
              mapVotersVotes[voterAddress].push(votersVotes(voterAddress,_candidateNationalId,""));
              ///////////////
              voterDetailsMap[voterAddress].numberOfVotes=voterDetailsMap[voterAddress].numberOfVotes+1;
              CandidateVoters[_candidateNationalId].push(voterAddress);
              totalVotes++;
  
    }
    function getTotalVotes() public view returns (uint)
    {
        return totalVotes;
    }
    ///////////////
    
    function addTxtHashVoter(address voterAddress,string _txtHash,string _nationalId) public
    {
        for(uint i=0;i<mapVotersVotes[voterAddress].length;i++)
        {
            if(keccak256(abi.encodePacked(mapVotersVotes[voterAddress][i].nationalId))==keccak256(abi.encodePacked( _nationalId)))
            {
                        mapVotersVotes[voterAddress][i].txtHash=_txtHash;
                        break;

            }
        }
    }
    ///////////////
    //checkIfVoted
 
    function addVoterVotes(address voterAddress,string _nationalId) public view  returns (string) {
        
        uint count=getNumberOfVotes(voterAddress);
              if(count >= votesCount)
                    return "You reached number of votes";
                

             for (uint i = 0 ; i < mapVotersVotes[voterAddress].length ; i++ ){

            if(keccak256(abi.encodePacked(mapVotersVotes[voterAddress][i].nationalId)) == keccak256(abi.encodePacked(_nationalId)))
                return "You already voted to this candidate before";
        }
       //  grantYourVote(voterAddress,candidateAddress);
         return "Done";
    }
    
    
    function getVotesCount () public view returns(uint){
        return votesCount;
    }
    
    function updateVotesCount(uint _votesCount) public {
        votesCount = _votesCount;
    }
    
    function getStartDate()public view returns(string){
        return startDate ;
    }
    
    
    function setStartDate (string _startDate) public{
      startDate=  _startDate;
    }
    
    
    
    
    function setPeriod(string _period) public 
    {
        period=_period;
    }
    function setEndTime(string _endTime) public
    {
        endTime=_endTime ;
        
    }
    
    function getPeriod ()   public view  returns(string){
        return period;
    }
    
    function getEndTime ()   public view  returns(string){
        return endTime;
    }
    
  
 
   
   function getNumberOfVotes(address _address)public view returns(uint)
   {
      
         return   voterDetailsMap[_address].numberOfVotes;
   }
    
    
       
   function getPrivateKey(address _address)public view returns(string)
   {
      
         return   voterInfoMap[_address].privatekey;
   }
    
    
    
    function revokeMyVote(address _voterAddress, string _nationalId) public 
    {
        for(uint i=0;i<mapVotersVotes[_voterAddress].length;i++)
        {
            if(keccak256(abi.encodePacked(mapVotersVotes[_voterAddress][i].nationalId))==keccak256(abi.encodePacked(_nationalId)))
            {
                 delete(mapVotersVotes[_voterAddress][i]);  
                voterDetailsMap[_voterAddress].numberOfVotes=voterDetailsMap[_voterAddress].numberOfVotes-1;
                 for(uint j=0; j < CandidateVoters[_nationalId].length;j++)
        {
            if(_voterAddress == CandidateVoters[_nationalId][j]){
                
                CandidateVoters[_nationalId][j]=0;
                break;
                
            }
            
        }
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
   
   function signUpVoter(address _address,string _privatekey,string nationalID,string password,string name,string birthOfDate,string city,string year)public  
   {
       
     addVoterInfo(_address,_privatekey,nationalID, name, birthOfDate, password);
     addVoterDetails (_address,nationalID,city, year);
     singInMap[nationalID]=_address;
     NumberOfVoters++;
   }
   function checkNationalID(string nationalID) public view returns (bool)
   {
 
if(signedUsers[nationalID]==true)
     {
return true;}
else
{
return false;}
   }
   
   
    ///// get candidate voters 
    
    function getCandidateVoters(string _candidateNationalId) public view returns(address[]){
        return CandidateVoters[_candidateNationalId];
    }
    
    
    
    function getNumberOfVoters()public view returns(uint){
        return NumberOfVoters;
    }
    
    
    
    
    
    
    
}