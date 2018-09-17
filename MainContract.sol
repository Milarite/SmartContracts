pragma solidity ^0.4.17;
 
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
    function getCandidatePhonenumber(string _nationalId) public view returns(string){
        return candidate.getCandidatePhonenumber(_nationalId);
    }
    
    
     function getCandidateCampaign(string _nationalId) public view returns(string){
        return candidate.getCandidateCampaign(_nationalId);
     }
    
     function getCandidateNationalID(uint index)public view returns (string)
    {
       return candidate.getNationalID(index);
    }
    
    function getCandidateNationalIDArrayLength() public view returns (uint)
    {
        return candidate.getNationalIDArrayLength();
    }
    function addCandidateDetails(string candidateIdNumber,string city,string year,string phoneNumber,string campaign) public{
        candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
     
    }
    
    function addCandidateTracking(string _nationalId,uint numberOfVotes) public{
        candidate.addCandidateTracking(_nationalId,numberOfVotes);
        
        
    }
    
    
    
    
    
    function getCandidateVotesNumber(string _nationalId) public view returns(uint){
        return candidate.getCandidateVotesNumber(_nationalId);
    }
    
    
    
    /////// getter values
    
    // function getAllCandidateInfo(address _address,uint index) public view returns(string,string)
    // {
    //   // string memory nationalId = candidate.getNationalID(index);
    //     return(getCandidateName(_address),getCandidatebirthOfDate(_address));
      
    // }
    
    function getCandidateName( string _nationalId) public view returns(string){
        return candidate.getCandidateName(_nationalId);
    }
    
    function getCandidatebirthOfDate(string _nationalId) public view returns(string){
        return candidate.getCandidatebirthOfDate(_nationalId);
    }
    
    
    
   function getCandidateCity(string _nationalId) public view returns(string){
       return candidate.getCandidateCity(_nationalId);
    }
    
    
      function getCandidateYear(string _nationalId) public view returns(string){
          return candidate.getCandidateYear(_nationalId);
    }
    
    
           function deleteCandidate(string _nationalId,string nationalID)public
           {
               candidate.deleteCandidate(_nationalId,nationalID);
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
    
        function getVotedCandidatesAddress(address voterAddress,uint index)public view returns (string)
    {
         return   voters.getVotedCandidatesAddress(voterAddress,index);
    }
    
    function getNationalIDArrayLength(address voterAddress) public view returns (uint)
    {
        return voters.getNationalIDArrayLength(voterAddress);
    }
    
    
       function checkIfVoted(address voterAddress,string _candidateNationalId) public view returns (string){
        
          return  voters.addVoterVotes(voterAddress,_candidateNationalId);
 
         
       }
           function grantYourVote(address _voterAddress,string _candidateNationalId)public

            {
                     voters.grantYourVote(_voterAddress,_candidateNationalId);
                     candidate.addCandidateTracking(_candidateNationalId,candidate.getCandidateVotesNumber(_candidateNationalId) + 1);//get last candidate votes and add 1

            }
        function revokeMyVote(address _voterAddress, string _candidateNationalId) public
        {
            voters.revokeMyVote(_voterAddress,_candidateNationalId);
          candidate.addCandidateTracking(_candidateNationalId,candidate.getCandidateVotesNumber(_candidateNationalId) - 1);//get last candidate votes and add 1

        }
    
    // function addVoterVotes(address _address,string voterIdNumber,string  candidateIdNumber) public returns(string){
        
    //     voters.addVoterVotes( _address,voterIdNumber,  candidateIdNumber);
    // }
    
    function getNumberOfVotes(address _address) public view returns(uint){
    
       return voters.getNumberOfVotes(_address);
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
      return  voters.getVoterCity(_address);
    }
    
    
      function getVoterYear(address _address) public view returns(string){
       return voters.getVoterYear(_address);
    }
    
    function getVoterName(address _address)  public view returns(string) {
       return voters.getVoterName(_address);
    }
    
    function getVoterDateOfBirth (address _address)public view returns(string){
     return   voters.getVoterDateOfBirth(_address);
    }
    
    
    function getCandidateNational(string _candidateNationalId) public view returns(string){
        
        return candidate.getCandidateNationalId(_candidateNationalId);
        
    }
    
    //////////////////////////////////////////////////////////////
      function checkNationalIDVoter(string nationalID) public view returns (bool)
      {
       return   voters.checkNationalID(nationalID);
      }
       
          function signUpVoter (address _address,string nationalID,string password,string name,string birthOfDate,string city,string year)
          public  
          {
              voters.signUpVoter(_address,nationalID,password,name,birthOfDate,city,year);
          }
 
         function checkIdAndPasswordVoter(string nationalID,string password) public view returns (address)
         {
             return voters.checkIdAndPassword(nationalID,password);
         }
 
    
 /////////////////////////////////////////////////////////////////////////
    
    
        //// end of voters functions    
    
    // start Judgment functions
    
    
    
    function addJudgmentInformation (address _address,string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgment.addJudgmentInformation ( _address,judgmentInformationId, name, birthOfDate, password);
    }
    
    function addCandidate(address _address,string candidateIdNumber , string name,string birthOfDate, string password,string city,string year,
    string phoneNumber,string campaign) public {
 
           candidate.addCandidate(candidateIdNumber,name,birthOfDate,password);
       candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
        candidate.addCandidateTracking(candidateIdNumber,0);
      
    }
    
    
    function sendEther(address _address , uint _balance) public payable{
        
        _address.transfer(_balance);
 
    }
    
     function getCandidateAddressByNationalId(string nationalId) public view returns(address){
        return candidate.getCandidateAddressByNationalId(nationalId);
    }
    
    function CandidateCheckIdAndPassword(string _candidateIdNumber , string password) public view returns (bool) {
        return candidate.checkIdAndPassword(_candidateIdNumber,password);
    }
    
   
     /*
      function getStartTime ()   public view  returns(uint){
        return voters.getStartTime();
    }
     function getEndTime ()   public view  returns(uint){
        return voters.getEndTime();
    }
    
    function getCandidateVoters (string _candidateNationalId) public view returns(bytes32[]){
        
        return voters.getCandidateVoters(_candidateNationalId);
        
        
    }
    
    */

   function getStartDate()public view returns(uint){
        return voters.getStartDate();
    }
       function setStartDate (uint _startDate) public{
        voters.setStartDate(_startDate);
    }
     function setStartTime(uint _startTime) public 
    {
        voters.setStartTime(_startTime);
    }
    function setEndTime(uint _endTime) public
    {
      voters.setEndTime(_endTime);
        
    }

 ////// period time and votes count
    
    
    function getVotesCount () public view returns(uint){
        return voters.getVotesCount();
    }
    
     function updateVotesCount(uint _votesCount) public {
       voters.updateVotesCount(_votesCount);
    }
   
   
    
    
    
    
}