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
    
    
    
    function Voting(string voterIdNumber,string  candidateIdNumber) public {
        
        voters.addVoterVotes(voterIdNumber,candidateIdNumber);
        candidate.addCandidateTracking(candidateIdNumber,candidate.getCandidateVotesNumber(candidateIdNumber) + 1);//get last candidate votes and add 1

    }
    
    ///// candidate Functions
    function getCandidatePhonenumber(string CandidateIdNumber) public view returns(string){
        return candidate.getCandidatePhonenumber(CandidateIdNumber);
    }
    
     function getCandidateNationalID(uint index)public view returns (string)
    {
       return candidate.getNationalID(index);
    }
    
    function getCandidateNationalIDArrayLength() public view returns (uint)
    {
        return candidate.getNationalIDArrayLength();
    }
    function addCandidateDetails(string candidateIdNumber,string city,string year,string phoneNumber) public{
        candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber);
     
    }
    
    function addCandidateTracking(string candidateIdNumber,uint numberOfVotes) public{
        candidate.addCandidateTracking(candidateIdNumber,numberOfVotes);
        
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(string candidateIdNumber) public view returns(uint){
        return candidate.getCandidateVotesNumber(candidateIdNumber);
    }
    
    
    
    /////// getter values
    
    function getAllCandidateInfo(uint index) public view returns(string,string,string)
    {
        string memory nationalId = candidate.getNationalID(index);
        return(nationalId,getCandidateName(nationalId),getCandidatebirthOfDate(nationalId));
      
    }
    
    function getCandidateName(string candidateIdNumber) public view returns(string){
        return candidate.getCandidateName(candidateIdNumber);
    }
    
    function getCandidatebirthOfDate(string candidateIdNumber) public view returns(string){
        return candidate.getCandidatebirthOfDate(candidateIdNumber);
    }
    
    
    
   function getCandidateCity(string candidateIdNumber) public view returns(string){
       return candidate.getCandidateCity(candidateIdNumber);
    }
    
    
      function getCandidateYear(string candidateIdNumber) public view returns(string){
          return candidate.getCandidateYear(candidateIdNumber);
    }
    
    
    
      function getCandidateNumberOfVotes(string candidateIdNumber) public view returns(uint){
          candidate.getCandidateNumberOfVotes(candidateIdNumber);
    }
    
    

    //////// end of getter
    
    /// end of candidate Functions
    
    
    
    
    //// voters functions 
    
    function addVoterInfo(string voterIdNumber,string name,string birthOfDate,string password) public {
        voters.addVoterInfo( voterIdNumber, name, birthOfDate, password);
          
    }
    
    function addVoterDetails (string voterIdNumber, string candidateIdNumber, string city,string year) public {
        voters.addVoterDetails ( voterIdNumber,  candidateIdNumber,  city, year);
    }
    
        function getNationalID(uint index)public view returns (string)
    {
         return   voters.getNationalID(index);
    }
    
    function getVotersNationalIDArrayLength() public view returns (uint)
    {
        return voters.getNationalIDArrayLength();
    }
    
    
    
    function addVoterVotes(string voterIdNumber,string  candidateIdNumber) public returns(string){
        
        voters.addVoterVotes( voterIdNumber,  candidateIdNumber);
    }
    
    function getVoterVotes(string voterIdNumber) public view returns(uint){
    
        voters.getVoterVotes( voterIdNumber);
    }
    
     function getVotersInfo(uint index) public view returns(string,string,string){
        string memory nationalId = voters.getNationalID(index);
        return(nationalId,voters.getVoterName(nationalId),voters.getVoterDateOfBirth(nationalId));
    }

        //// end of voters functions    

    
    
    
    // start Judgment functions
    
    
    
    function addJudgmentInformation (string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgment.addJudgmentInformation ( judgmentInformationId, name, birthOfDate, password);
    }
    
    function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password,string city,string year,
    string phoneNumber) public {

           candidate.addCandidate(candidateIdNumber,name,birthOfDate,password);
        candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber);
      
    }
    
    
  // end judgment functions
    
}

