<<<<<<< HEAD
pragma solidity ^0.5.1;
=======
pragma solidity ^0.4.17;
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
 
import "./Candidates.sol";
import "./Voters.sol";
import "./Judgment.sol";
 
 
contract MainContract  {
    
   
   bool threshouldFLag=false;
    Candidates candidate;
    Voters voters;
    Judgment judgment;

    constructor(Candidates _candidate , Voters _voters,Judgment _judgment) public{
        candidate = _candidate;
        voters = _voters;
        judgment = _judgment;
      }
<<<<<<< HEAD
    uint public ElectionStartTime;
    string public PercentageOfVoters;
 
    ///// candidate Functions
    function getCandidatePhonenumber(string memory _nationalId) public view returns(string memory){
        return candidate.getCandidatePhonenumber(_nationalId);
    }
     function getCandidateCampaign(string  memory _nationalId) public view returns(string memory){
        return candidate.getCandidateCampaign(_nationalId);
     }
    
     function getCandidateNationalID(uint index)public view returns (string memory)
    {
       return candidate.getNationalID(index);
    }
    
    function getCandidateNationalIDArrayLength() public view returns (uint)
    {
        return candidate.getNationalIDArrayLength();
    }
    function addCandidateDetails(string memory candidateIdNumber,string memory city,string memory year,string memory phoneNumber,string memory campaign) public{
        candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
     
    }
    
    function addCandidateTracking(string memory _nationalId,uint numberOfVotes) public{
        candidate.addCandidateTracking(_nationalId,numberOfVotes);
    }
    function getCandidateVotesNumber(string memory _nationalId) public view returns(uint){
        return candidate.getCandidateVotesNumber(_nationalId);
    }
    function getCandidateName( string memory _nationalId) public view returns(string memory){
        return candidate.getCandidateName(_nationalId);
    }
    
    function getCandidatebirthOfDate(string memory _nationalId) public view returns(string memory){
        return candidate.getCandidatebirthOfDate(_nationalId);
    }
   function getCandidateCity(string memory _nationalId) public view returns(string memory){
       return candidate.getCandidateCity(_nationalId);
    }
    function getCandidateYear(string memory _nationalId) public view returns(string memory){
          return candidate.getCandidateYear(_nationalId);
=======
    

    
    uint public ElectionStartTime;
    string public PercentageOfVoters;
 
    
    ///// candidate Functions
    function getCandidatePhonenumber(string _nationalId) public view returns(string){
        return candidate.getCandidatePhonenumber(_nationalId);
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    }
           function deleteCandidate(string memory _nationalId)public
           {
               candidate.deleteCandidate(_nationalId);
           }
                   function addTxtHashToCandidate(string memory nationalIdCandidate,string memory txtHash) public
                   {
                       candidate.addTxtHashToCandidate(nationalIdCandidate,txtHash);
                   }
                       function removeTxtHashToCandidate(string memory nationalIdCandidate,string memory txtHash) public
                          {
                              candidate.removeTxtHashToCandidate(nationalIdCandidate,txtHash);
                          }
                          
                          
                          function getTxtHash(string memory nationalId,uint index)public view returns (string memory)
                          {
                              return candidate.getTxtHash(nationalId,index);
                          }
                          
                                 function getCandidateTxtHashStatusLength(string memory candidateIdNumber)public view returns (uint)
                                 {
                                     return candidate.getCandidateTxtHashStatusLength(candidateIdNumber);
                                 }
                                 
                       function getTxtHashFlag(string memory nationalId,uint index)public view returns (int)
                       {
                           return candidate.getTxtHashFlag(nationalId,index);
                       }
                          /////////////////////////
    //   function getCandidateNumberOfVotes(string candidateIdNumber) public view returns(uint){
    //       candidate.getCandidateNumberOfVotes(candidateIdNumber);
    // }
    
<<<<<<< HEAD
    function winnerCandidate() public view returns(string memory){
        return candidate.winnerCandidate();
=======
    
     function getCandidateCampaign(string _nationalId) public view returns(string){
        return candidate.getCandidateCampaign(_nationalId);
     }
    
     function getCandidateNationalID(uint index)public view returns (string)
    {
       return candidate.getNationalID(index);
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    }
 
    //////// end of getter
    
<<<<<<< HEAD
    /// end of candidate Functions
    //// voters functions
    function addTxtHashVoter(address voterAddress,string memory _txtHash,string memory _nationalId) public
    {
        
        voters.addTxtHashVoter(voterAddress,_txtHash,_nationalId);
    }
          function getVotedCandidatesTxtHash(address voterAddress,uint idex)public view returns (string memory)
          {
              return voters.getVotedCandidatesTxtHash(voterAddress,idex);
              
          }
        function getVotedCandidatesAddress(address voterAddress,uint index)public view returns (string memory)
    {
         return   voters.getVotedCandidatesAddress(voterAddress,index);
    }
    function getNationalIDArrayLength(address voterAddress) public view returns (uint)
    {
        return voters.getNationalIDArrayLength(voterAddress);
=======
    function getCandidateNationalIDArrayLength() public view returns (uint)
    {
        return candidate.getNationalIDArrayLength();
    }
    function addCandidateDetails(string candidateIdNumber,string city,string year,string phoneNumber,string campaign) public{
        candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
     
    }
    
    function addCandidateTracking(string _nationalId,uint numberOfVotes) public{
        candidate.addCandidateTracking(_nationalId,numberOfVotes);
        
        
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    }
       function checkIfVoted(address voterAddress,string memory _candidateNationalId) public view returns (string memory){
        
          return  voters.addVoterVotes(voterAddress,_candidateNationalId);
     
       }
           function grantYourVote(address _voterAddress,string memory _candidateNationalId)public

            {
                     voters.grantYourVote(_voterAddress,_candidateNationalId);
                     candidate.addCandidateTracking(_candidateNationalId,candidate.getCandidateVotesNumber(_candidateNationalId) + 1);//get last candidate votes and add 1
            }
    // function addVoterVotes(address _address,string voterIdNumber,string  candidateIdNumber) public returns(string){
        
    //     voters.addVoterVotes( _address,voterIdNumber,  candidateIdNumber);
    // }
    
    function getNumberOfVotes(address _address) public view returns(uint){
    
<<<<<<< HEAD
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

     function getVoterCity(address _address) public view returns(string memory){
      return  voters.getVoterCity(_address);
    }
     function getVoterYear(address _address) public view returns(string memory){
       return voters.getVoterYear(_address);
    }
    
    function getVoterName(address _address)  public view returns(string memory) {
       return voters.getVoterName(_address);
=======
    
    
    
    function getCandidateVotesNumber(string _nationalId) public view returns(uint){
        return candidate.getCandidateVotesNumber(_nationalId);
    }
    
    
    
    /////// getter values
    
   
    
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
    
    
           function deleteCandidate(string _nationalId)public
           {
               candidate.deleteCandidate(_nationalId);
           }
           
           
           ////////////////////// 
                   function addTxtHashToCandidate(string nationalIdCandidate,string txtHash) public
                   {
                       candidate.addTxtHashToCandidate(nationalIdCandidate,txtHash);
                   }
                       function removeTxtHashToCandidate(string nationalIdCandidate,string txtHash) public
                          {
                              candidate.removeTxtHashToCandidate(nationalIdCandidate,txtHash);
                          }
                          
                          
                          function getTxtHash(string nationalId,uint index)public view returns (string)
                          {
                              return candidate.getTxtHash(nationalId,index);
                          }
                          
                                 function getCandidateTxtHashStatusLength(string candidateIdNumber)public view returns (uint)
                                 {
                                     return candidate.getCandidateTxtHashStatusLength(candidateIdNumber);
                                 }
                                 
                       function getTxtHashFlag(string nationalId,uint index)public view returns (int)
                       {
                           return candidate.getTxtHashFlag(nationalId,index);
                       }

                          
                          /////////////////////////
    //   function getCandidateNumberOfVotes(string candidateIdNumber) public view returns(uint){
    //       candidate.getCandidateNumberOfVotes(candidateIdNumber);
    // }
    
    function winnerCandidate() public view returns(string){
        return candidate.winnerCandidate();
    }
 
    //////// end of getter
    
    /// end of candidate Functions
    
    
    
    //// voters functions 
    
    
    
    
    
    
    
    ///////////////////
    function addTxtHashVoter(address voterAddress,string _txtHash,string _nationalId) public
    {
        
        voters.addTxtHashVoter(voterAddress,_txtHash,_nationalId);
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    }
    ////////////////
    
<<<<<<< HEAD
    function getVoterDateOfBirth (address _address)public view returns(string memory){
     return   voters.getVoterDateOfBirth(_address);
    }
    function getCandidateNational(string memory _candidateNationalId) public view returns(string memory){
        
        return candidate.getCandidateNationalId(_candidateNationalId);
    }
    ///////////////////////////////////////////////////////////
    function getPrivateKey(address _address)public view returns(string memory)
   {
      
         return   voters.getPrivateKey(_address);
   }
    
      function checkNationalIDVoter(string  memory nationalID) public view returns (bool)
      {
       return   voters.checkNationalID(nationalID);
      }
       
   function signUpVoter(address _address,string memory _privatekey,string memory nationalID,string memory password,string memory name,string memory birthOfDate,string memory city,string memory year)  
          public  
          {
              voters.signUpVoter(_address,_privatekey,nationalID,password,name,birthOfDate,city,year);
          }
 
         function checkIdAndPasswordVoter(string memory nationalID,string memory password) public view returns (address)
         {
             return voters.checkIdAndPassword(nationalID,password);
         }
         
           function getTotalVotes() public view returns (uint)
    {
         return voters.getTotalVotes();
    }
 /////////////////////////////////////////////////////////////////////////
    //// end of voters functions
    // start Judgment functions
    function addJudgmentInformation (address _address,string memory judgmentInformationId,string  memory name,string memory birthOfDate,string memory password) public {
        
        judgment.addJudgmentInformation ( _address,judgmentInformationId, name, birthOfDate, password);
=======
    
    
    
    
    //////////
          function getVotedCandidatesTxtHash(address voterAddress,uint idex)public view returns (string)
          {
              return voters.getVotedCandidatesTxtHash(voterAddress,idex);
              
          }
          //////////////

    
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
        
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    }
    
    function addCandidate(string  memory candidateIdNumber , string memory name,string memory birthOfDate, string memory password,string memory city,string memory year,
    string memory phoneNumber,string memory campaign) public {
 
           candidate.addCandidate(candidateIdNumber,name,birthOfDate,password);
       candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
        candidate.addCandidateTracking(candidateIdNumber,0);
      
    }
    // function sendEther(address _address , uint _balance) public payable{
        
    //     _address.transfer(_balance);
 
    // }
    
<<<<<<< HEAD
     function getCandidateAddressByNationalId(string memory nationalId) public view returns(bool){
        return candidate.getCandidateAddressByNationalId(nationalId);
    }
    
    function CandidateCheckIdAndPassword(string memory _candidateIdNumber , string memory password) public view returns (bool) {
        return candidate.checkIdAndPassword(_candidateIdNumber,password);
    }
      function getPeriod ()   public view  returns(string memory){
        return voters.getPeriod();
    }
     function getEndTime ()   public view  returns(string memory){
        return voters.getEndTime();
    }
    
    // function getCandidateVoters (string memory _candidateNationalId) public view returns(address []){
=======
    
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
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
        
    //     return voters.getCandidateVoters(_candidateNationalId);
  //  }
  function getStartDate()public view returns(string memory){
        return voters.getStartDate();
    }
<<<<<<< HEAD
      function setStartDate (string memory _startDate) public{
        voters.setStartDate(_startDate);
    }
     function setPeriod(string  memory _startTime) public 
    {
        voters.setPeriod(_startTime);
    }
    function setEndTime(string memory _endTime) public
    { 
      voters.setEndTime(_endTime);
 }

=======
    
    
    
    //////////////////////////////////////////////////////////////
    
    
      function getPrivateKey(address _address)public view returns(string)
   {
      
         return   voters.getPrivateKey(_address);
   }
    
      function checkNationalIDVoter(string nationalID) public view returns (bool)
      {
       return   voters.checkNationalID(nationalID);
      }
       
   function signUpVoter(address _address,string _privatekey,string nationalID,string password,string name,string birthOfDate,string city,string year)  
          public  
          {
              voters.signUpVoter(_address,_privatekey,nationalID,password,name,birthOfDate,city,year);
          }
 
         function checkIdAndPasswordVoter(string nationalID,string password) public view returns (address)
         {
             return voters.checkIdAndPassword(nationalID,password);
         }
         
           function getTotalVotes() public view returns (uint)
    {
         return voters.getTotalVotes();
    }
 
    
 /////////////////////////////////////////////////////////////////////////
    
    
        //// end of voters functions    
    
    // start Judgment functions
    
    
    
    function addJudgmentInformation (address _address,string judgmentInformationId,string name,string birthOfDate,string password) public {
        
        judgment.addJudgmentInformation ( _address,judgmentInformationId, name, birthOfDate, password);
    }
    
    function addCandidate(string candidateIdNumber , string name,string birthOfDate, string password,string city,string year,
    string phoneNumber,string campaign) public {
 
           candidate.addCandidate(candidateIdNumber,name,birthOfDate,password);
       candidate.addCandidateDetails(candidateIdNumber,city,year,phoneNumber,campaign);
        candidate.addCandidateTracking(candidateIdNumber,0);
      
    }
    
    
    function sendEther(address _address , uint _balance) public payable{
        
        _address.transfer(_balance);
 
    }
    
     function getCandidateAddressByNationalId(string nationalId) public view returns(bool){
        return candidate.getCandidateAddressByNationalId(nationalId);
    }
    
    function CandidateCheckIdAndPassword(string _candidateIdNumber , string password) public view returns (bool) {
        return candidate.checkIdAndPassword(_candidateIdNumber,password);
    }
    
   
     
      function getPeriod ()   public view  returns(string){
        return voters.getPeriod();
    }
     function getEndTime ()   public view  returns(string){
        return voters.getEndTime();
    }
    
    function getCandidateVoters (string _candidateNationalId) public view returns(address[]){
        
        return voters.getCandidateVoters(_candidateNationalId);
        
        
    }
    
    

  function getStartDate()public view returns(string){
        return voters.getStartDate();
    }
      function setStartDate (string _startDate) public{
        voters.setStartDate(_startDate);
    }
     function setPeriod(string _startTime) public 
    {
        voters.setPeriod(_startTime);
    }
    function setEndTime(string _endTime) public
    {
        
        
      voters.setEndTime(_endTime);
        
    }

 //// period time and votes count
    
    
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    function getVotesCount () public view returns(uint){
        return voters.getVotesCount();
    }
    
     function updateVotesCount(uint _votesCount) public {
      voters.updateVotesCount(_votesCount);
    }
<<<<<<< HEAD
=======
    
function getCurrentTime() public view returns (uint)
{
    return now;
}
   
   
function startElection() public {
    ElectionStartTime = now;
                                }
                                
                                
function getNumberOfVoters ()public view returns (uint){
    return voters.getNumberOfVoters();
}

function setPercentageOfVoters(string _percentage) public {
    PercentageOfVoters = _percentage;
}

function getPercentageOfVoters() public view returns(string){
    return PercentageOfVoters;
}

function getElectionStartTime() public view returns(uint){
    return ElectionStartTime;
}

function setThresholdFlag(bool flag)public
{
    threshouldFLag=flag;
}
function getThresholdFlag() public view returns (bool)
{
    return threshouldFLag;
}
                                
                                
                                




   
>>>>>>> 404443d4954bdaeb2cb680d96c9b1abee488d434
    
function getCurrentTime() public view returns (uint)
{
    return now;
}  
function startElection() public {
    ElectionStartTime = now;
}                                
function getNumberOfVoters ()public view returns (uint){
    return voters.getNumberOfVoters();
}

function setPercentageOfVoters(string  memory _percentage) public {
    PercentageOfVoters = _percentage;
}

function getPercentageOfVoters() public view returns(string memory){
    return PercentageOfVoters;
}

function getElectionStartTime() public view returns(uint){
    return ElectionStartTime;
}

function setThresholdFlag(bool flag)public
{
    threshouldFLag=flag;
}
function getThresholdFlag() public view returns (bool)
{
    return threshouldFLag;
}
}