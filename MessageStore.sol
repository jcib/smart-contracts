pragma solidity *0.4.24;

contract MessageStore {
    
    address private owner;
    string private message;
    
    constructor() public {
        
        owner = msg.sender;
        
    }
    
    function setMessage(string newMessage) public {
        message = newMessage;
    }
    
    function getMessage() public view returns (string){
        
        return message;
    }
         
}
