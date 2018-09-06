pragma solidity ^0.4.24;

import "./Candidates.sol";
import "./Voters.sol";
import "./Judgment.sol";


contract MainContract  {
    
   
    Candidates candidate;
    Voters voters;
    Judgment judgment;
    
    constructor(Candidates _candidate , Voters _voters,Judgment _judgment) public{
        candidate = _candidate;
        voters = _voters;
        judgment = _judgment;
      }
    
    
    
 
    
    ///// candidate Functions
    function getCandidatePhonenumber(address _address) public view returns(string){
        return candidate.getCandidatePhonenumber(_address);
    }
    
    
     function getCandidateCampaign(address _address) public view returns(string){
        return candidate.getCandidateCampaign(_address);
     }
    
     function getCandidateNationalID(uint index)public view returns (address)
    {
       return candidate.getNationalID(index);
    }
    
    function getCandidateNationalIDArrayLength() public view returns (uint)
    {
        return candidate.getNationalIDArrayLength();
    }
    function addCandidateDetails(address _address,string candidateIdNumber,string city,string year,string phoneNumber,string campaign) public{
        candidate.addCandidateDetails( _address,candidateIdNumber,city,year,phoneNumber,campaign);
     
    }
    
    function addCandidateTracking(address _address,uint numberOfVotes) public{
        candidate.addCandidateTracking(_address,numberOfVotes);
        
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(address _address) public view returns(uint){
        return candidate.getCandidateVotesNumber(_address);
    }
    
    
    
    /////// getter values
    
    // function getAllCandidateInfo(address _address,uint index) public view returns(string,string)
    // {
    //   // string memory nationalId = candidate.getNationalID(index);
    //     return(getCandidateName(_address),getCandidatebirthOfDate(_address));
      
    // }
    
    function getCandidateName( address _address) public view returns(string){
        return candidate.getCandidateName(_address);
    }
    
    function getCandidatebirthOfDate(address _address) public view returns(string){
        return candidate.getCandidatebirthOfDate(_address);
    }
    
    
    
   function getCandidateCity(address _address) public view returns(string){
       return candidate.getCandidateCity(_address);
    }
    
    
      function getCandidateYear(address _address) public view returns(string){
          return candidate.getCandidateYear(_address);
    }
    
    
    
    //   function getCandidateNumberOfVotes(string candidateIdNumber) public view returns(uint){
    //       candidate.getCandidateNumberOfVotes(candidateIdNumber);
    // }
    
    

    //////// end of getter
    
    /// end of candidate Functions
    
    
    
    //// voters functions 
    
    // function addVoterInfo(address _address,string voterIdNumber,string name,string birthOfDate,string password) public {
    //     voters.addVoterInfo(_address, voterIdNumber, name, birthOfDate, password);
          
    // }
    
    // function addVoterDetails (address _address,string voterIdNumber, string city,string year) public {
    //     voters.addVoterDetails (_address, voterIdNumber,  city, year);
    // }
    
        function getVotedCandidatesAddress(address voterAddress,uint index)public view returns (address)
    {
         return   voters.getVotedCandidatesAddress(voterAddress,index);
    }
    
    function getNationalIDArrayLength(address voterAddress) public view returns (uint)
    {
        return voters.getNationalIDArrayLength(voterAddress);
    }
    
    
       function Voting(address voterAddress,address CandidateAddress) public {
        
        voters.addVoterVotes(voterAddress,CandidateAddress);
        candidate.addCandidateTracking(CandidateAddress,candidate.getCandidateVotesNumber(CandidateAddress) + 1);//get last candidate votes and add 1

    }
    
    // function addVoterVotes(address _address,string voterIdNumber,string  candidateIdNumber) public returns(string){
        
    //     voters.addVoterVotes( _address,voterIdNumber,  candidateIdNumber);
    // }
    
    function getNumberOfVotes(address _address) public view returns(uint){
    
        voters.getNumberOfVotes(_address);
    }
    
    //  function getVotersInfo(uint index) public view returns(string,string){
    //     //string memory nationalId = voters.getNationalID(index);
    //     return(voters.getVoterName(_address),voters.getVoterDateOfBirth(_address));
    // }




    
    
    
        
    function deleteVoterDetail(address _address) public{
        voters.deleteVoterDetail(_address);
        
    }
    
    // function getCandidateByVoterDetails(address _address)public view  returns(string)  {
    //     return votersVotesMap[_address].candidateIdNumber;
    // }
    
    
     function getVoterCity(address _address) public view returns(string){
        voters.getVoterCity(_address);
    }
    
    
      function getVoterYear(address _address) public view returns(string){
        voters.getVoterYear(_address);
    }
    
    function getVoterName(address _address)  public view returns(string) {
        voters.getVoterName(_address);
    }
    
    function getVoterDateOfBirth (address _address)public view returns(string){
        voters.getVoterDateOfBirth(_address);
    }
    
    
    
    
    

    
    
        //// end of voters functions    

    
    
    
    // start Judgment functions
    
    
    
    function addJudgmentInformation (address _address,string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgment.addJudgmentInformation ( _address,judgmentInformationId, name, birthOfDate, password);
    }
    
    function addCandidate(address _address,string candidateIdNumber , string name,string birthOfDate, string password,string city,string year,
    string phoneNumber,string campaign) public {

           candidate.addCandidate(_address,candidateIdNumber,name,birthOfDate,password);
        candidate.addCandidateDetails(_address,candidateIdNumber,city,year,phoneNumber,campaign);
        candidate.addCandidateTracking(_address,0);
      
    }
    
    function sendEther(address _address , uint _balance) public payable{
        
        // _address.transfer(_balance);

    }
    
}